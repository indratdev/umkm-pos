@extends('layouts/blankLayout')

@section('title', 'Register Basic - Pages')

@section('page-style')
    <!-- Page -->
    <link rel="stylesheet" href="{{ asset('assets/vendor/css/pages/page-auth.css') }}">
@endsection


@section('content')
    <div class="container-xxl">
        <div class="authentication-wrapper authentication-basic container-p-y">
            <div class="authentication-inner">
                <!-- Register Card -->
                <div class="card">
                    <div class="card-body">
                        <!-- Logo -->
                        <div class="app-brand justify-content-center">
                            <a href="{{ url('/') }}" class="app-brand-link gap-2">
                                <span class="app-brand-logo demo">@include('_partials.macros', [
                                    'width' => 25,
                                    'withbg' => 'var(--bs-primary)',
                                ])</span>
                                <span
                                    class="app-brand-text demo text-body fw-bold">{{ config('variables.templateName') }}</span>
                            </a>
                        </div>
                        <!-- /Logo -->
                        <h4 class="mb-2">Adventure starts here 🚀</h4>
                        <p class="mb-4">Make your app management easy and fun!</p>

                        @if (session()->has('success_register'))
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                {{ session('success_register') }}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"
                                    aria-label="Close"></button>
                            </div>
                        @endif

                        {{-- @if (\Session::has('password_error'))
                            <div class="alert alert-danger">
                                <ul>
                                    <li>{!! \Session::get('password_error') !!}</li>
                                </ul>
                            </div>
                        @endif --}}

                        {{-- @if ($errors->any())
                            <div class="alert alert-danger">
                                <ul>
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif --}}

                        <form id="formAuthentication" class="mb-3" action="/register" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label for="fullname" class="form-label">FullName</label>
                                {{-- @error('fullname')
                                    <div class="invalid-feedback">
                                        {{ $message }}
                                    </div>
                                @enderror --}}
                                <input type="text" class="form-control" {{-- @error('fullname') is-invalid @enderror --}} id="fullname"
                                    name="fullname" placeholder="Enter your fullname" value="{{ old('fullname') }}"
                                    autofocus required>
                                {{-- @error('fullname')
                                    <div class="invalid-feedback">
                                        Please Input fullname
                                    </div>
                                @enderror --}}
                            </div>

                            <div class="mb-3">
                                <label for="businessName" class="form-label">Business Name</label>
                                <input type="text" class="form-control" id="businessName" name="businessName"
                                    placeholder="Enter your business name" value="{{ old('businessName') }}" autofocus
                                    required>
                            </div>
                            <div class="mb-3">
                                <label for="email" class="form-label">Email</label>
                                <input type="text" class="form-control" id="email" name="email"
                                    placeholder="Enter your email" value="{{ old('email') }}" required>
                            </div>
                            <div class="mb-3 form-password-toggle">
                                <label class="form-label" for="password">Password</label>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="password" class="form-control" name="password"
                                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                        aria-describedby="password" />
                                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                </div>
                            </div>

                            <div class="mb-3 form-password-toggle">
                                <label class="form-label" for="password">Re-type Password</label>
                                <div class="input-group input-group-merge">
                                    <input type="password" id="repassword" class="form-control" name="repassword"
                                        placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                        aria-describedby="password" />
                                    <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                                </div>
                            </div>

                            {{-- <div class="mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="terms-conditions" name="terms">
                                    <label class="form-check-label" for="terms-conditions">
                                        I agree to
                                        <a href="javascript:void(0);">privacy policy & terms</a>
                                    </label>
                                </div>
                            </div> --}}
                            <button class="btn btn-primary d-grid w-100">
                                Sign up
                            </button>
                        </form>

                        <p class="text-center">
                            <span>Already have an account?</span>
                            <a href="/">
                                <span>Sign in instead</span>
                            </a>
                        </p>
                    </div>
                </div>
                <!-- Register Card -->
            </div>
        </div>
    </div>
@endsection
