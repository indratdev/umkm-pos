<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProjectController extends Controller
{
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
}
