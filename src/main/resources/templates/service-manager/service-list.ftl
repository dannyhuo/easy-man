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
                        <#assign nodes=nodes>
                        <#include "service-form.ftl" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- The main content -->
    <div class="container-fluid mt--6">
        <!-- Table -->
        <div class="row">
            <div class="col">
                <div class="card">
                    <!-- Card header -->
                    <div class="card-header border-0">
                        <h3 class="mb-0">Service Lists</h3>
                    </div>
                    <!-- Light table -->
                    <div class="table-responsive" data-toggle="list" data-list-values='["serviceId", "serviceName", "startCmd", "stopCmd","nodeId","status","comment","createTime","updateTime"]'>
                        <table class="table align-items-center table-flush">
                            <thead class="thead-light">
                            <tr>
                                <th scope="col" class="sort" data-sort="serviceId">Service ID</th>
                                <th scope="col" class="sort" data-sort="serviceName">Service Name</th>
                                <th scope="col" class="sort" data-sort="startCmd">Start CMD</th>
                                <th scope="col" class="sort" data-sort="stopCmd">Stop CMD</th>
                                <th scope="col" class="sort" data-sort="nodeId">Node ID</th>
                                <th scope="col" class="sort" data-sort="status">Status</th>
                                <th scope="col" class="sort" data-sort="comment">Comment</th>
                                <th scope="col" class="sort" data-sort="createTime">Create Time</th>
                                <th scope="col" class="sort" data-sort="updateTime">Update Time</th>
                                <th scope="col">action</th>
                            </tr>
                            </thead>
                            <tbody class="list">

                            <#list nodeServices as service>
                                <tr>
                                    <th scope="row">
                                        <div class="media align-items-center">
                                            <div class="media-body">
                                                <span class="serviceId mb-0 text-sm" data-toggle="tooltip" data-original-title="${service.serviceId?c}">${service.serviceId?c}</span>
                                            </div>
                                        </div>
                                    </th>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <i class="bg-warning"></i>
                                            <span class="serviceName" data-toggle="tooltip" data-original-title="${service.serviceName!}">${service.serviceName!}</span>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <span class="startCmd" data-toggle="tooltip" data-original-title="${service.startCmd!}">${service.startCmd!}</span>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <span class="stopCmd" data-toggle="tooltip" data-original-title="${service.stopCmd!}">${service.stopCmd!}</span>
                                        </span>
                                    </td>
                                    <td>
                                        <div class="badge badge-dot mr-4">
                                            <span class="nodeId" data-toggle="tooltip" data-original-title="${service.nodeId!}">${service.nodeId!}</span>
                                        </div>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <span class="status" data-toggle="tooltip" data-original-title="${service.status!}">${service.status!}</span>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <span class="comment" data-toggle="tooltip" data-original-title="${service.comment!}">${service.comment!}</span>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <i class="bg-inverse-warning"></i>
                                            <span class="createTime" data-toggle="tooltip" data-original-title="${service.createTime!}">${service.createTime!}</span>
                                        </span>
                                    </td>
                                    <td>
                                        <span class="badge badge-dot mr-4">
                                            <span class="updateTime" data-toggle="tooltip" data-original-title="${service.updateTime!}">${service.updateTime!}</span>
                                        </span>
                                    </td>
                                    <td class="table-actions">
                                        <a href="#!" class="table-action" role="button" data-toggle="dropdown" aria-haspopup="true">
                                            <i class="fas fa-user-edit"></i>
                                        </a>
                                        <#assign service=service>
                                        <#assign title="Edit service">
                                        <#--<#assign nodes=nodes>-->
                                        <#include "service-form.ftl" />
                                        <a href="#" class="table-action table-action-delete" aria-expanded="false"
                                           data-original-title="Delete service" onclick="deleteService(${service.serviceId?c}, '${service.serviceName}')">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </td>
                                </tr>
                            </#list>
                            </tbody>
                        </table>
                    </div>
                    <!-- 分页 -->
                    <#include "../template/pager.ftl" />
                </div>
            </div>
        </div>

        <#--<div class="card" data-select2-id="7">-->
            <#--<!-- Card header &ndash;&gt;-->
            <#--<div class="card-header">-->
                <#--<h3 class="mb-0">Dropdowns</h3>-->
            <#--</div>-->
            <#--<!-- Card body &ndash;&gt;-->
            <#--<div class="card-body" data-select2-id="6">-->
                <#--<select class="js-example-basic-single" name="state">-->
                    <#--<option value="AL">Alabama</option>-->
                    <#--<option value="WY">Wyoming</option>-->
                <#--</select>-->
            <#--</div>-->
        <#--</div>-->


        <!-- Footer -->
        <#include "../template/footer.ftl" />

    </div>
</div>
<#include "../template/scripts.ftl" />

<script type="application/javascript" src="../static/myjs/servicemanager/service-list.js"></script>
</body>

</html>