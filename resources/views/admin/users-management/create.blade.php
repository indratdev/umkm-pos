@extends('layouts/contentNavbarLayout')

@section('title', 'Create Master Project')

@section('content')
    <h4 class="py-3 mb-1">
        Create User
    </h4>

    @if (session()->has('success'))
        <div class="alert alert-success alert-dismissible fade show" role="alert">
            {{ session('success') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    @if (session()->has('error'))
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            {{ session('error') }}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    @endif

    <!-- Basic Layout & Basic with Icons -->
    <div class="row">
        <!-- Basic Layout -->
        <div class="col-xxl">
            <div class="card mb-4">
                <div class="card-body">
                    <form id="formCreateProject" class="mb-3" action="/user-management/create" method="POST">
                        @csrf
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">From Project</label>
                            <div class="col-sm-10">
                                <div class="mb-3">
                                    <select id="select2Basic" class="select2 form-select form-select-lg" name="fromproject"
                                        data-allow-clear="true">
                                        @foreach ($project_data as $project)
                                            <option value="{{ $project->pid }}">{{ $project->name }}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Fullname</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="basic-default-name" placeholder="John Doe"
                                    name="fullname" value="{{ old('fullname') }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company">Email</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="email" name="email"
                                    placeholder="Enter your email" value="{{ old('email') }}" required>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-password">Password</label>
                            <div class="col-sm-10">
                                <input type="password" id="password" class="form-control" name="password"
                                    placeholder="&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;&#xb7;"
                                    aria-describedby="password" />
                                <span class="input-group-text cursor-pointer"><i class="bx bx-hide"></i></span>
                            </div>
                        </div>


                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company">Address</label>
                            <div class="col-sm-10">
                                <textarea id="basic-default-message" class="form-control" placeholder="Jalan Panglima Polim VII"
                                    aria-describedby="basic-icon-default-message2" name="address">{{ old('address') }}</textarea>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-identity-number">No. Identity
                                (KTP)</label>
                            <div class="col-sm-10">
                                <input type="text" id="basic-default-identity-number" class="form-control phone-mask"
                                    placeholder="658 799 8941" aria-label="658 799 8941"
                                    aria-describedby="basic-default-identity-number" name="identity_number"
                                    value="{{ old('identity_number') }}" />
                            </div>
                        </div>





                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-phone">Phone No</label>
                            <div class="col-sm-10">
                                <input type="text" id="basic-default-phone" class="form-control phone-mask"
                                    placeholder="658 799 8941" aria-label="658 799 8941"
                                    aria-describedby="basic-default-phone" name="phone" value="{{ old('phone') }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-gender">Gender</label>
                            <div class="col-sm-10">
                                <div class="form-check mt-3">
                                    <input class="form-check-input" type="radio" value="male" id="gender-male"
                                        name="gender" />
                                    <label class="form-check-label" for="gender-male">
                                        Male
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="female" id="gender-female"
                                        name="gender" checked />
                                    <label class="form-check-label" for="gender-female">
                                        Female
                                    </label>
                                </div>
                            </div>
                        </div>

                        {{-- role --}}
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-gender">Role</label>
                            <div class="col-sm-10">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="owner" id="role-owner"
                                        name="role" />
                                    <label class="form-check-label" for="role-owner">
                                        Owner
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="admin" id="role-admin"
                                        name="role" />
                                    <label class="form-check-label" for="role-admin">
                                        Admin
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" value="staff" id="role-staff"
                                        name="role" checked />
                                    <label class="form-check-label" for="role-staff">
                                        Staff
                                    </label>
                                </div>
                            </div>
                        </div>
                </div>


                <div class="row justify-content-end">
                    <div class="col-sm-10">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
    </div>

@endsection
