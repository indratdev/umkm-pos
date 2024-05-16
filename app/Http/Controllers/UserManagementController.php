<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserManagementController extends Controller
{
  protected $userController;


  public function __construct(UserController $userController)
  {
    $this->userController = $userController;
  }

  public function index()
  {
    $user_all = $this->userController->getAllUser();

    $datas = [
      'data' => $user_all,
    ];
    return view('admin.users.index', $datas);
  }

  public function create()
  {
    return view('admin.users.create');
  }

  public function store(Request $request)
  {
  }

  public function edit(string $id)
  {
  }

  public function update(Request $request, string $id)
  {
  }

  public function delete(string $id)
  {
  }
}
