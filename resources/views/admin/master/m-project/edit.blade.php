@extends('layouts/contentNavbarLayout')

@section('title', 'Edit Master Project')

@section('content')
    <h4 class="py-3 mb-1">
        Update Master Project
    </h4>

    <!-- Basic Layout & Basic with Icons -->
    <div class="row">
        <!-- Basic Layout -->
        <div class="col-xxl">
            <div class="card mb-4">
                {{-- <div class="card-header d-flex align-items-center justify-content-between">
                    <h5 class="mb-0">Basic Layout</h5> <small class="text-muted float-end">Default label</small>
                </div> --}}
                <div class="card-body">
                    @foreach ($datas as $data)
                        <form id="formCreateProject" class="mb-3" action="/master-project/{{ $data->id }}" method="POST">
                            @csrf
                            @method('PUT')
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-name">Name</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="basic-default-name"
                                        placeholder="John Doe" name="name" value="{{ $data->name }}" />
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-company">Address</label>
                                <div class="col-sm-10">
                                    <textarea id="basic-default-message" class="form-control" placeholder="Jalan Panglima Polim VII"
                                        aria-describedby="basic-icon-default-message2" name="address">{{ $data->address }}</textarea>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-company">Province</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="basic-default-company"
                                        placeholder="DKI Jakarta" name="province" value="{{ $data->province }}" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-company">City</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="basic-default-company"
                                        placeholder="Jakarta Selatan" name="city" value="{{ $data->city }}" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-company">ZIP Code</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="basic-default-company"
                                        placeholder="13555" name="zipcode" value="{{ $data->zipcode }}" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-company">NPWP</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="basic-default-company"
                                        placeholder="01032122233xxxx" name="npwp" value="{{ $data->npwp }}" />
                                </div>
                            </div>



                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-phone">Phone No</label>
                                <div class="col-sm-10">
                                    <input type="text" id="basic-default-phone" class="form-control phone-mask"
                                        placeholder="658 799 8941" aria-label="658 799 8941"
                                        aria-describedby="basic-default-phone" name="phone" value="{{ $data->phone }}" />
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-phone">Is Headquarters</label>
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input type="hidden" name="is_headquarters" value="0">
                                        <!-- Input tersembunyi untuk nilai 0 -->
                                        <input class="form-check-input" type="checkbox" value="1" id="defaultCheck3"
                                            {{ $data->is_headquarters == '1' ? 'checked="checked"' : '' }}
                                            name="is_headquarters">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label" for="basic-default-phone">Active</label>
                                <div class="col-sm-10">
                                    <div class="form-check">
                                        <input type="hidden" name="actived" value="0">
                                        <!-- Input tersembunyi untuk nilai 0 -->
                                        <input class="form-check-input" type="checkbox" value="1"
                                            id="defaultCheck4" {{ $data->actived == '1' ? 'checked="checked"' : '' }}
                                            name="actived">
                                    </div>
                                </div>
                            </div>

                            <div class="row justify-content-end">
                                <div class="col-sm-10">
                                    <button type="submit" class="btn btn-primary">Update</button>
                                </div>
                            </div>
                        </form>
                    @endforeach
                </div>
            </div>
        </div>
    </div>

@endsection
