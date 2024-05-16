@extends('layouts/contentNavbarLayout')

@section('title', 'Master Project')

@section('content')
    <h4 class="py-3 mb-1">
        User Management
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


    <div class="p-2 d-flex justify-content-end">
        {{-- <a href="{{ route('project-create') }}" class="btn btn-primary">Add New</a>         --}}
    </div>
    <!-- Basic Bootstrap Table -->
    <div class="card">
        <div class="table-responsive text-nowrap">
            <table class="table">
                <thead>
                    <tr>
                        <th>No. </th>
                        <th>Project</th>
                        <th>Email</th>
                        <th>Fullname</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody class="table-border-bottom-0">
                    @foreach ($data as $key => $dataProject)
                        <tr>
                            <td> {{ $key + 1 }}</td>
                            <td> {{ $dataProject->pid_name }}</td>
                            <td> {{ $dataProject->email }} </td>
                            <td> {{ $dataProject->fullname }} </td>
                            <td>
                                @if ($dataProject->actived == 1)
                                    <span class="badge bg-label-primary me-1">Active</span>
                                @else
                                    <span class="badge bg-label-warning me-1">Non Active</span>
                                @endif
                            </td>
                            <td>
                                <div class="dropdown">
                                    <button type="button" class="btn p-0 dropdown-toggle hide-arrow"
                                        data-bs-toggle="dropdown"><i class="bx bx-dots-vertical-rounded"></i></button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="/master-project/{{ $dataProject->id }}"><i
                                                class="bx bx-edit-alt me-1"></i>
                                            Edit</a>
                                        <a class="dropdown-item" data-bs-toggle="modal"
                                            data-bs-target="#modalToggle{{ $dataProject->id }}">
                                            <i class="bx bx-trash me-1"></i> Delete
                                        </a>
                                    </div>


                                    <!-- Modal -->
                                    <div class="modal fade" id="modalToggle{{ $dataProject->id }}" tabindex="-1"
                                        aria-labelledby="modalToggleLabel{{ $dataProject->id }}" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modalToggleLabel{{ $dataProject->id }}">
                                                        Confirm Delete</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                        aria-label="Close"></button>
                                                </div>
                                                <div class="modal-body">
                                                    Are you sure you want to delete this project?
                                                    [{{ $dataProject->name }}]
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary"
                                                        data-bs-dismiss="modal">Cancel</button>
                                                    <form method="POST"
                                                        action="/master-project/{{ $dataProject->id }}/delete">
                                                        @csrf
                                                        @method('PUT')
                                                        <button type="submit" class="btn btn-danger">Delete</button>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
        <div class="row p-3">
            <div class="col-12 d-flex justify-content-end">
                <nav aria-label="Page navigation example">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
    <!--/ Basic Bootstrap Table -->
@endsection
