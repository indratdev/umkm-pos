<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UserController extends Controller
{
  public function getUser(string $email)
  {
    return DB::table('users')
      ->select('id', 'name', 'fullname', 'email')
      ->where('email', '=', $email)
      ->where('actived', '=', '1')
      ->where('deleted', '=', '0')
      ->first();
  }
}
