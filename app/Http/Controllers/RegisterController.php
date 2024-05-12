<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RegisterController extends Controller
{

  protected $userController;
  protected $projectController;


  public function __construct(UserController $userController, ProjectController $projectController)
  {
    $this->userController = $userController;
    $this->projectController = $projectController;
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

    $result = DB::statement("CALL sp_register_user(?, ?, ?, ?, ?)", [$fullname, $email, $password, 'owner', $token]);

    if (!$request) {
      return redirect()->back()->with('error', 'Failed registration new user');
    }

    // get user id
    $users = $this->userController->getUser($email);

    // insert master project
    $mproject = $this->projectController->createProject($users->id, $businessName);


    $message = 'Registration Successfully!';
    return redirect()->back()->with('success_register', $message);
  }
}
