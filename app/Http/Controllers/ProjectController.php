<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProjectController extends Controller
{

  protected $userController;


  public function __construct(UserController $userController)
  {
    $this->userController = $userController;
  }

  public function index()
  {
    $m_project_data = $this->readMasterProject(0);

    $datas = [
      'content' => 'users.index',
      'data' => $m_project_data,
    ];

    return view('admin.master.m-project.index', $datas);
  }


  // CREATE
  public function create()
  {
    return view('admin.master.m-project.create');
  }

  public function store(Request $request)
  {
    $user = Auth::user();

    $result =  DB::table('m_projects')->insert([
      'owner_id' => $user->id,
      'pid' => $user->pid,
      'name' => $request->input('name'),
      'address' => $request->input('address'),
      'province' => $request->input('province'),
      'city' => $request->input('city'),
      'zipcode' => $request->input('zipcode'),
      'npwp' => $request->input('npwp'),
      'phone' => $request->input('phone'),
      'is_headquarters' => $request->input('is_headquarters'),
      'actived' => '1',
      'deleted' => '0',
      'created_at' => now(),
    ]);

    if (!$result) {
      return redirect()->back()->with('error', 'Failed create new project');
    }

    $message = 'Create Project Successfully!';
    return redirect()->back()->with('success', $message);
  }

  public function createProject(string $ownerId, string $name, string $pid)
  {
    return DB::table('m_projects')->insertGetId([
      'owner_id' => $ownerId,
      'pid' => $pid,
      'name' => $name,
      'is_headquarters' => '1',
      'actived' => '1',
      'deleted' => '0',
      'created_at' => now(),
    ]);
  }

  // EDIT
  public function edit(string $id)
  {
    $project = DB::table('m_projects')
      ->select('*')
      ->where('id', '=', $id)
      ->where('deleted', '=', '0')
      ->get();

    // dd($project);

    $data = [
      'datas' => $project
    ];

    return view('admin.master.m-project.edit', $data);
  }

  public function update(Request $request, string $id)
  {
    $name = $request->input('name');
    $address =  $request->input('address');
    $province =  $request->input('province');
    $city =  $request->input('city');
    $zipcode =  $request->input('zipcode');
    $npwp =  $request->input('npwp');
    $phone =  $request->input('phone');
    $is_headquarters =  $request->input('is_headquarters');
    $actived =  $request->input('actived');


    $request = DB::statement(
      "CALL sp_update_master_project(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [$name, $address, $province, $city, $zipcode, $npwp, $phone, $is_headquarters, $id, $actived]
    );

    if (!$request || $id <= 0) {
      return redirect()->back()->with('error', 'Failed update project');
    }

    return redirect()->route('project-index')->with('success', 'Update project successfully!');
  }

  // DELETE
  public function delete(string $id)
  {
    if ($id <= 0) {
      return redirect()->back()->with('error', 'Failed to delete project');
    }

    $usersId = $this->userController->getUserLoginId();

    $result = DB::table('m_projects')
      ->where('id', $id)
      ->update(['deleted' => 1, 'deleted_at' => now(), 'deleted_by' => $usersId]);

    if (!$result) {
      return redirect()->back()->with('error', 'Failed to delete project');
    }

    return redirect()->back()->with('success', 'Delete Project Successfully!');
  }

  // READ
  public function readMasterProject(string $ownerId)
  {
    return DB::select("CALL sp_read_master_project(?)", [$ownerId]);
  }
}
