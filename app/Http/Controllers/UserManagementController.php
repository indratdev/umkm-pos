<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserManagementController extends Controller
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
    $user_all = $this->userController->getAllUser();


    $datas = [
      'data' => $user_all,
    ];

    return view('admin.users-management.index', $datas);
  }

  public function create()
  {
    $project_all = $this->projectController->readMasterProject(0);
    $datas = [
      'project_data' => $project_all,
    ];

    return view('admin.users-management.create', $datas);
  }

  public function store(Request $request)
  {
    dd($request);
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
