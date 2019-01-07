<nav class="sidenav navbar navbar-vertical fixed-left navbar-expand-xs navbar-light bg-white" id="sidenav-main">
    <div class="scrollbar-inner">
        <!-- Brand -->
        <div class="sidenav-header d-flex align-items-center">
            <a class="navbar-brand" href="#!">
                <img src="../static/assets/img/brand/blue.png" class="navbar-brand-img" alt="...">
            </a>
            <div class="ml-auto">
                <!-- Sidenav toggler -->
                <div class="sidenav-toggler d-none d-xl-block" data-action="sidenav-unpin" data-target="#sidenav-main">
                    <div class="sidenav-toggler-inner">
                        <i class="sidenav-toggler-line"></i>
                        <i class="sidenav-toggler-line"></i>
                        <i class="sidenav-toggler-line"></i>
                    </div>
                </div>
            </div>
        </div>
        <div class="navbar-inner">
            <!-- Collapse -->
            <div class="collapse navbar-collapse" id="sidenav-collapse-main">
                <!-- Nav items -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" href="#navbar-dashboards" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="navbar-dashboards">
                            <i class="ni ni-tv-2 text-primary"></i>
                            <span class="nav-link-text">Dashboards</span>
                        </a>
                        <div class="collapse show" id="navbar-dashboards">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Cpu Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Memory Dashboard</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Disk Dashboard</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#navbar-node-manager" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-node-manager">
                            <i class="ni ni-building text-orange"></i>
                            <span class="nav-link-text">Node Manager</span>
                        </a>
                        <div class="collapse" id="navbar-node-manager">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Nodes</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Terminal</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hosts Manage</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Iptable Manage</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#navbar-node-monitor" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-node-monitor">
                            <i class="ni ni-ambulance text-info"></i>
                            <span class="nav-link-text">Node Monitor</span>
                        </a>
                        <div class="collapse" id="navbar-node-monitor">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Disk monitor</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Cpu monitor</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Memory monitor</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Process monitor</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#navbar-components" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-components">
                            <i class="ni ni-app text-pink"></i>
                            <span class="nav-link-text">Components</span>
                        </a>
                        <div class="collapse" id="navbar-components">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">JDK</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Scala</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Zookeeper</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hadoop</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hbase</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Spark</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hive</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">kylin</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">elastic</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#navbar-app-website" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-app-website">
                            <i class="ni ni-planet text-green"></i>
                            <span class="nav-link-text">App Website</span>
                        </a>
                        <div class="collapse" id="navbar-app-website">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Yarn web</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hdfs web</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#navbar-app-console" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-app-console">
                            <i class="ni ni-laptop text-default"></i>
                            <span class="nav-link-text">App Console</span>
                        </a>
                        <div class="collapse" id="navbar-app-console">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hadoop</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hbase</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Hive</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Zookeeper</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#navbar-service-manager" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="navbar-service-manager">
                            <i class="ni ni-settings-gear-65 text-blue"></i>
                            <span class="nav-link-text">Service Manager</span>
                        </a>
                        <div class="collapse" id="navbar-service-manager">
                            <ul class="nav nav-sm flex-column">
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Service manage</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Log view</a>
                                </li>
                                <li class="nav-item">
                                    <a href="#!" class="nav-link">Health view</a>
                                </li>
                            </ul>
                        </div>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="#!">
                            <i class="ni ni-spaceship text-red"></i>
                            <span class="nav-link-text">Gc Monitor</span>
                        </a>
                    </li>

                </ul>
                <!-- Divider -->
                <hr class="my-3">
                <!-- Heading -->
                <h6 class="navbar-heading p-0 text-muted">Documentation</h6>
                <!-- Navigation -->
                <ul class="navbar-nav mb-md-3">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" target="_blank">
                            <i class="ni ni-books"></i>
                            <span class="nav-link-text">Getting started</span>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>