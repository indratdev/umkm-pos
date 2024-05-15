<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Ramsey\Uuid\Type\Integer;
use Illuminate\Support\Facades\DB;

class AccessUserController extends Controller
{
  public function createAccessUser(string $pid, string $branch_id, int $user_id)
  {
    return DB::table('m_access_users')->insert([
      'pid' => $pid,
      'branch_id' => $branch_id,
      'user_id' => $user_id,
      'actived' => '1',
      'deleted' => '0',
    ]);
  }
}
