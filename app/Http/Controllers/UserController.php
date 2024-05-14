<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

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

  public function getUserLoginId()
  {
    return Auth::user()->id;
  }
}
