<!-- Input groups -->
<div class="dropdown-menu dropdown-menu-xl dropdown-menu-right py-0 overflow-hidden">
    <!-- Card header -->
    <div class="card-header">
        <h3 class="mb-0">${title}</h3>
    </div>
    <!-- Card body -->
    <div class="card-body">
        <form action="/service/<#if service?exists>update<#else>save</#if>" method="post">
            <input name="serviceId" type="hidden" value="<#if service?exists>${service.serviceId?c}</#if>">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <span class="input-group">Service name</span>
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-server"></i></span>
                            </div>
                            <input name="serviceName" class="form-control" value="<#if service?exists>${service.serviceName!}</#if>" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Start CMD</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="startCmd" class="form-control" value="<#if service?exists>${service.startCmd!}</#if>" type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="input-group">Stop CMD</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="stopCmd" class="form-control" value="<#if service?exists>${service.stopCmd!}</#if>" type="text">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-map-marker"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Node ID</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="nodeId" class="form-control" value="<#if service?exists>${service.nodeId!}</#if>" type="text">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-eye"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="input-group">Status</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="status" class="form-control" value="<#if service?exists>${service.status!}</#if>" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Comment</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="comment" class="form-control" value="<#if service?exists>${service.comment!}</#if>" type="text">
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <button class="btn btn-primary" type="submit">Submit</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>