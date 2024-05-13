<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProjectController extends Controller
{

  public function index()
  {
    $m_project_data = $this->readMasterProject(0);
    // dd($m_project_data);

    $datas = [
      'content' => 'users.index',
      'data' => $m_project_data,
    ];

    return view('m_project.index', $datas);
  }


  // CREATE
  public function create()
  {
    return view('m_project.create');
  }

  public function store(Request $request)
  {
    $user = Auth::user()->id;

    $result =  DB::table('m_projects')->insert([
      'owner_id' => $user,
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

  public function createProject(string $ownerId, string $name)
  {
    return DB::table('m_projects')->insert([
      'owner_id' => $ownerId,
      'name' => $name,
      'is_headquarters' => '1',
      'actived' => '1',
      'deleted' => '0',
      'created_at' => now(),
    ]);
  }

  // READ
  public function readMasterProject(string $ownerId)
  {
    return DB::select("CALL sp_read_master_project(?)", [$ownerId]);
  }
}
