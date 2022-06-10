<div class="nav flex-column flex-nowrap vh-100 overflow-auto text-white p-2 bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

    <!-- Sidebar - Brand -->
    <a class="sidebar-brand d-flex align-items-center justify-content-center mt-5 mb-5" href="#">
        <!-- <div class="sidebar-brand-icon rotate-n-15">
            <i class="fas fa-laugh-wink"></i>
        </div> -->
        <img src="{{asset('assets/logo/bu.png')}}" class="img-responsive" width="50%" alt="Logo Bottle Union">
        <!-- <div class="sidebar-brand-text mx-3">SB Admin <sup>2</sup></div> -->
    </a>

    <!-- Divider -->
    <hr class="sidebar-divider my-0">

    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseSettings" aria-expanded="true" aria-controls="collapseSettings">
            <i class="fas fa-fw fa-cog"></i>
            <span>Settings</span>
        </a>
        <div id="collapseSettings" class="collapse show" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <a class="collapse-item {{Route::currentRouteName()=='dashboard.user.index' ? 'active' : ''}}" href="{{route('dashboard.user.index')}}">
                    <i class="fas fa-fw fa-user-plus"></i>
                    <span>Create User</span>
                </a>
            </div>
        </div>
    </li>

    <hr class="sidebar-divider d-none d-md-block">

    <!-- Sidebar Toggler (Sidebar) -->
    <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
    </div>

</div>

<!-- //start js section -->

<!-- //end js section -->