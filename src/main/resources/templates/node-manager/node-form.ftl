<!-- Input groups -->
<div class="dropdown-menu dropdown-menu-xl dropdown-menu-right py-0 overflow-hidden">
    <!-- Card header -->
    <div class="card-header">
        <h3 class="mb-0">${title}</h3>
    </div>
    <!-- Card body -->
    <div class="card-body">
        <form action="/nodes/<#if node?exists>update<#else>save</#if>" method="post">
            <input name="nodeId" type="hidden" value="<#if node?exists>${node.nodeId?c}</#if>">
            <div class="row">
                <div class="col-md-6">
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <span class="input-group">Node name</span>
                            <div class="input-group-prepend">
                                <span class="input-group-text"><i class="fas fa-server"></i></span>
                            </div>
                            <input name="nodeName" class="form-control" value="<#if node?exists>${node.nodeName!}</#if>" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Host name</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="hostName" class="form-control" value="<#if node?exists>${node.hostName!}</#if>" type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="input-group">IP</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="ip" class="form-control" value="<#if node?exists>${node.ip!}</#if>" type="text">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-map-marker"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">IP Public</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="ipPublic" class="form-control" value="<#if node?exists>${node.ipPublic!}</#if>" type="text">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-eye"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="input-group">Hosts</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="hosts" class="form-control" value="<#if node?exists>${node.hosts!}</#if>" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Comment</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="comment" class="form-control" placeholder="<#if node?exists>${node.comment!}</#if>" value="<#if node?exists>${node.comment!}</#if>" type="text">
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