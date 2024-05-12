<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;

class LoginController extends Controller
{
  public function index()
  {
    return view('login.login');
  }

  public function login(Request $request)
  {

    $credentials = $request->validate([
      'email' => 'required|email',
      'password' => 'required',
    ]);


    // dd($credentials);



    // dd($credentials);

    if (Auth::attempt($credentials)) {
      $request->session()->regenerate();

      return redirect()->intended('/dashboard');
    }


    return back()
      ->with('loginError', 'Login Failed!')
      // ->withErrors([
      //   'email' => 'The provided credentials do not match our records.',
      // ])
      ->onlyInput('email');
  }

  public function logout(Request $request): RedirectResponse
  {
    Auth::logout();

    $request->session()->invalidate();

    $request->session()->regenerateToken();

    return redirect('/');
  }
}
