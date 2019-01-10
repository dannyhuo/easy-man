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
                            <input name="serviceName" class="form-control" placeholder="<#if service?exists>${service.serviceName!}</#if>" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Start CMD</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="startCmd" class="form-control" placeholder="<#if service?exists>${service.startCmd!}</#if>" type="text">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="input-group">Stop CMD</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="stopCmd" class="form-control" placeholder="<#if service?exists>${service.stopCmd!}</#if>" type="text">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="fas fa-map-marker"></i></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Node</span>
                    <div class="card-body" data-select2-id="6">
                        <form data-select2-id="5">
                            <select name="nodeId" class="form-control select2-hidden-accessible" data-toggle="select" data-select2-id="1" tabindex="-1" aria-hidden="true">
                                <#list nodes as node>
                                    <option data-select2-id="${node.nodeId?c}">${node.nodeName}</option>
                                </#list>
                            </select>
                            <#--<span class="select2 select2-container select2-container--default select2-container--below select2-container--focus" dir="ltr" data-select2-id="2" style="width: 713.5px;">-->
                                <#--<span class="selection">-->
                                    <#--<span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="0" aria-labelledby="select2-tm9l-container">-->
                                        <#--<span class="select2-selection__rendered" id="select2-tm9l-container" role="textbox" aria-readonly="true" title="Alerts">Alerts</span>-->
                                        <#--<span class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span>-->
                                    <#--</span>-->
                                <#--</span>-->
                                <#--<span class="dropdown-wrapper" aria-hidden="true"></span>-->
                            <#--</span>-->
                        </form>
                    </div>


                    <#--<div class="form-group">-->
                        <#--<div class="input-group input-group-merge">-->
                            <#--<input name="nodeId" class="form-control" placeholder="<#if service?exists>${service.nodeId!}</#if>" type="text">-->
                            <#--<div class="input-group-append">-->
                                <#--<span class="input-group-text"><i class="fas fa-eye"></i></span>-->
                            <#--</div>-->
                        <#--</div>-->
                    <#--</div>-->
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <span class="input-group">Hosts</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="hosts" class="form-control" placeholder="<#if service?exists>${service.hosts!}</#if>" type="text">
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <span class="input-group">Comment</span>
                    <div class="form-group">
                        <div class="input-group input-group-merge">
                            <input name="comment" class="form-control" placeholder="<#if service?exists>${service.comment!}</#if>" type="text">
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