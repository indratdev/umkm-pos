@extends('layouts/contentNavbarLayout')

@section('title', 'Create Master Project')

@section('content')
    <h4 class="py-3 mb-1">
        Create Master Project
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
                {{-- <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="mb-0">Basic Layout</h5> <small class="text-muted float-end">Default label</small>
                </div> --}}
                <div class="card-body">
                    <form id="formCreateProject" class="mb-3" action="/master-project/create" method="POST">
                        @csrf
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-name">Name</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="basic-default-name" placeholder="John Doe"
                                    name="name" value="{{ old('name') }}" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company">Address</label>
                            <div class="col-sm-10">
                                <textarea id="basic-default-message" class="form-control" placeholder="Jalan Panglima Polim VII" {{-- aria-describedby="basic-icon-default-message2"  --}}
                                    name="address">
                                    {{-- {{ old('address') }} --}}
                                  </textarea>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company">Province</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="basic-default-company"
                                    placeholder="DKI Jakarta" name="province" value="{{ old('province') }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company">City</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="basic-default-company"
                                    placeholder="Jakarta Selatan" name="city" value="{{ old('city') }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company">ZIP Code</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="basic-default-company" placeholder="13555"
                                    name="zipcode" value="{{ old('zipcode') }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-company">NPWP</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="basic-default-company"
                                    placeholder="01032122233xxxx" name="npwp" value="{{ old('npwp') }}" />
                            </div>
                        </div>

                        {{-- <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-email">Email</label>
                            <div class="col-sm-10">
                                <div class="input-group input-group-merge">
                                    <input type="text" id="basic-default-email" class="form-control"
                                        placeholder="john.doe" aria-label="john.doe"
                                        aria-describedby="basic-default-email2" />
                                    <span class="input-group-text" id="basic-default-email2">@example.com</span>
                                </div>
                                <div class="form-text"> You can use letters, numbers & periods </div>
                            </div>
                        </div> --}}

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-phone">Phone No</label>
                            <div class="col-sm-10">
                                <input type="text" id="basic-default-phone" class="form-control phone-mask"
                                    placeholder="658 799 8941" aria-label="658 799 8941"
                                    aria-describedby="basic-default-phone" name="phone" value="{{ old('phone') }}" />
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="basic-default-phone">Is Headquarters</label>
                            <div class="col-sm-10">
                                <div class="form-check">
                                    <input type="hidden" name="is_headquarters" value="0">
                                    <!-- Input tersembunyi untuk nilai 0 -->
                                    <input class="form-check-input" type="checkbox" value="1" id="defaultCheck3"
                                        {{ old('is_headquarters') == 'on' ? 'checked="checked"' : '' }}
                                        name="is_headquarters">
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
