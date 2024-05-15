<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UtilityController extends Controller
{
  public function generatePid(string $email)
  {
    return hash('sha256', $email);
  }
}
