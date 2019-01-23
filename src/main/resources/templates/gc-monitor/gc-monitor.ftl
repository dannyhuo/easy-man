<!DOCTYPE html>
<html>

<head>
    <#include "../template/meta.ftl" />
</head>

<body>
<!-- Sidenav -->
<#include "../template/menu.ftl" />

<!-- Main content -->
<div class="main-content" id="panel">
    <!-- Topnav -->
    <#include "../template/navigator.ftl" />
    <!-- Header -->
    <#--<#include "../template/header.ftl" />-->
    <!-- Header -->
    <div class="header bg-primary pb-6">
        <div class="container-fluid">
            <div class="header-body">
                <div class="row align-items-center py-4">
                    <div class="col-lg-6 col-7">
                        <h6 class="h2 text-white d-inline-block mb-0">Service Manager</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Service Manager</a></li>
                                <li class="breadcrumb-item active" aria-current="page">List</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-lg-6 col-5 text-right">
                        <a href="#" class="btn btn-sm btn-neutral" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Add Service</a>
                        <#assign title="Add new service">
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- The main content -->
    <div class="container-fluid mt--6">
        <!-- Table -->
        <div class="row">
            <div id="echarts_container" class="col">
                <!--js自动绘制echarts图表-->
            </div>
        </div>

        <!-- Footer -->
        <#include "../template/footer.ftl" />

    </div>
</div>
<#include "../template/scripts.ftl" />

<script type="application/javascript" src="../static/assets/vendor/echarts.js.dist/echarts.min.js"></script>

<script type="application/javascript" src="../static/myjs/gc-monitor/gc-monitor.js"></script>
</body>

</html>