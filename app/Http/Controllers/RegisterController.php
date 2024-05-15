<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{

  protected $userController;
  protected $projectController;
  protected $utilityController;
  protected $accessUsersController;


  public function __construct(UserController $userController, ProjectController $projectController, UtilityController $utilityController, AccessUserController $accessUsersController)
  {
    $this->userController = $userController;
    $this->projectController = $projectController;
    $this->utilityController = $utilityController;
    $this->accessUsersController = $accessUsersController;
  }


  public function index()
  {
    return view('register.index');
  }

  public function create(Request $request)
  {

    if ($request->input('password') != $request->input('repassword')) {
      return redirect()->back()->with('password_error', 'Your password and confirmation password do not match.');
    }

    $request->validate([
      'fullname' => 'required|max:255',
      'businessName' => 'required|max:255',
      'email' => 'required|email:dns|unique:users',
      'password' => 'required|min:5|max:255',
    ]);

    $fullname = $request->input('fullname');
    $email = $request->input('email');
    $password = bcrypt($request->input('password'));
    $token = $request->input('_token');
    $businessName = $request->input('businessName');
    $pid = $this->utilityController->generatePid($email);

    $result = DB::statement("CALL sp_register_user(?, ?, ?, ?, ?, ?)", [$fullname, $email, $password, 'owner', $token, $pid]);

    if (!$request) {
      return redirect()->back()->with('error', 'Failed registration new user');
    }

    // get user id
    $users = $this->userController->getUser($email);

    // insert master project
    $branch_id = $this->projectController->createProject($users->id, $businessName, $pid);

    // insert m_access_users
    $this->accessUsersController->createAccessUser($pid, $branch_id, $users->id);

    $message = 'Registration Successfully!';
    return redirect()->back()->with('success_register', $message);
  }
}
