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
                        <h6 class="h2 text-white d-inline-block mb-0">Node Manager</h6>
                        <nav aria-label="breadcrumb" class="d-none d-md-inline-block ml-md-4">
                            <ol class="breadcrumb breadcrumb-links breadcrumb-dark">
                                <li class="breadcrumb-item"><a href="#"><i class="fas fa-home"></i></a></li>
                                <li class="breadcrumb-item"><a href="#">Nodes</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Nodes</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="col-lg-6 col-5 text-right">
                        <a href="#" class="btn btn-sm btn-neutral" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Add Nodes</a>
                        <#assign title="Add new node">
                        <#include "node-form.ftl" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- The main content -->
    <div class="container-fluid mt--6">


        <div class="card">
            <!-- Card header -->
            <div class="card-header">
                <h3 class="mb-0">Terminal</h3>
            </div>
            <!-- Card body -->
            <div class="card-body">
                <form action="/nodes/">
                    <div class="ql-toolbar ql-snow">
                        <span class="ql-formats">
                            <button type="button" class="ql-bold">
                                <svg viewBox="0 0 18 18">
                                    <path class="ql-stroke" d="M5,4H9.5A2.5,2.5,0,0,1,12,6.5v0A2.5,2.5,0,0,1,9.5,9H5A0,0,0,0,1,5,9V4A0,0,0,0,1,5,4Z"></path>
                                    <path class="ql-stroke" d="M5,9h5.5A2.5,2.5,0,0,1,13,11.5v0A2.5,2.5,0,0,1,10.5,14H5a0,0,0,0,1,0,0V9A0,0,0,0,1,5,9Z"></path>
                                </svg>
                            </button>
                            <button type="button" class="ql-italic">
                                <svg viewBox="0 0 18 18"> <line class="ql-stroke" x1="7" x2="13" y1="4" y2="4"></line>
                                    <line class="ql-stroke" x1="5" x2="11" y1="14" y2="14"></line>
                                    <line class="ql-stroke" x1="8" x2="10" y1="14" y2="4"></line>
                                </svg>
                            </button>
                        </span>
                        <span class="ql-formats">
                            <button type="button" class="ql-link">
                                <svg viewBox="0 0 18 18">
                                    <line class="ql-stroke" x1="7" x2="11" y1="7" y2="11"></line>
                                    <path class="ql-even ql-stroke" d="M8.9,4.577a3.476,3.476,0,0,1,.36,4.679A3.476,3.476,0,0,1,4.577,8.9C3.185,7.5,2.035,6.4,4.217,4.217S7.5,3.185,8.9,4.577Z"></path>
                                    <path class="ql-even ql-stroke" d="M13.423,9.1a3.476,3.476,0,0,0-4.679-.36,3.476,3.476,0,0,0,.36,4.679c1.392,1.392,2.5,2.542,4.679.36S14.815,10.5,13.423,9.1Z"></path>
                                </svg>
                            </button>
                            <button type="button" class="ql-blockquote">
                                <svg viewBox="0 0 18 18"> <rect class="ql-fill ql-stroke" height="3" width="3" x="4" y="5"></rect>
                                    <rect class="ql-fill ql-stroke" height="3" width="3" x="11" y="5"></rect>
                                    <path class="ql-even ql-fill ql-stroke" d="M7,8c0,4.031-3,5-3,5"></path>
                                    <path class="ql-even ql-fill ql-stroke" d="M14,8c0,4.031-3,5-3,5"></path>
                                </svg></button><button type="button" class="ql-code">
                            <svg viewBox="0 0 18 18">
                                <polyline class="ql-even ql-stroke" points="5 7 3 9 5 11"></polyline>
                                <polyline class="ql-even ql-stroke" points="13 7 15 9 13 11"></polyline>
                                <line class="ql-stroke" x1="10" x2="8" y1="5" y2="13"></line>
                            </svg>
                        </button>
                            <button type="button" class="ql-image">
                                <svg viewBox="0 0 18 18">
                                    <rect class="ql-stroke" height="10" width="12" x="3" y="4"></rect>
                                    <circle class="ql-fill" cx="6" cy="7" r="1"></circle>
                                    <polyline class="ql-even ql-fill" points="5 12 5 11 7 9 8 10 11 7 13 9 13 12 5 12"></polyline>
                                </svg>
                            </button>
                        </span>
                        <span class="ql-formats">
                            <button type="button" class="ql-list" value="ordered">
                                <svg viewBox="0 0 18 18">
                                    <line class="ql-stroke" x1="7" x2="15" y1="4" y2="4"></line>
                                    <line class="ql-stroke" x1="7" x2="15" y1="9" y2="9"></line>
                                    <line class="ql-stroke" x1="7" x2="15" y1="14" y2="14"></line>
                                    <line class="ql-stroke ql-thin" x1="2.5" x2="4.5" y1="5.5" y2="5.5"></line>
                                    <path class="ql-fill" d="M3.5,6A0.5,0.5,0,0,1,3,5.5V3.085l-0.276.138A0.5,0.5,0,0,1,2.053,3c-0.124-.247-0.023-0.324.224-0.447l1-.5A0.5,0.5,0,0,1,4,2.5v3A0.5,0.5,0,0,1,3.5,6Z"></path>
                                    <path class="ql-stroke ql-thin" d="M4.5,10.5h-2c0-.234,1.85-1.076,1.85-2.234A0.959,0.959,0,0,0,2.5,8.156"></path>
                                    <path class="ql-stroke ql-thin" d="M2.5,14.846a0.959,0.959,0,0,0,1.85-.109A0.7,0.7,0,0,0,3.75,14a0.688,0.688,0,0,0,.6-0.736,0.959,0.959,0,0,0-1.85-.109"></path>
                                </svg>
                            </button>
                            <button type="button" class="ql-list" value="bullet">
                                <svg viewBox="0 0 18 18">
                                    <line class="ql-stroke" x1="6" x2="15" y1="4" y2="4"></line>
                                    <line class="ql-stroke" x1="6" x2="15" y1="9" y2="9"></line>
                                    <line class="ql-stroke" x1="6" x2="15" y1="14" y2="14"></line>
                                    <line class="ql-stroke" x1="3" x2="3" y1="4" y2="4"></line>
                                    <line class="ql-stroke" x1="3" x2="3" y1="9" y2="9"></line>
                                    <line class="ql-stroke" x1="3" x2="3" y1="14" y2="14"></line>
                                </svg>
                            </button>
                        </span>
                    </div>
                    <div data-toggle="quill" data-quill-placeholder="Quill WYSIWYG" class="ql-container ql-snow">
                        <div class="ql-editor ql-blank" data-gramm="false" contenteditable="true" data-placeholder="Quill WYSIWYG"><p><br></p></div>
                        <div class="ql-clipboard" contenteditable="true" tabindex="-1"></div>
                        <div class="ql-tooltip ql-hidden"><a class="ql-preview" target="_blank" href="about:blank"></a>
                            <input type="text" data-formula="e=mc^2" data-link="https://quilljs.com" data-video="Embed URL">
                            <a class="ql-action"></a>
                            <a class="ql-remove"></a>
                        </div>
                    </div>
                </form>
            </div>
        </div>






        <div class="row">
            <div class="col-xl-6">
                <!--* Card header *-->
                <!--* Card body *-->
                <!--* Card init *-->
                <div class="card">
                    <!-- Card header -->
                    <div class="card-header">
                        <!-- Surtitle -->
                        <h6 class="surtitle">Overview</h6>
                        <!-- Title -->
                        <h5 class="h3 mb-0">Total sales</h5>
                    </div>
                    <!-- Card body -->
                    <div class="card-body">
                        <div class="chart"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                            <!-- Chart wrapper -->
                            <canvas id="chart-sales" class="chart-canvas chartjs-render-monitor" width="1722" height="700" style="display: block; height: 350px; width: 861px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xl-6">
                <!--* Card header *-->
                <!--* Card body *-->
                <!--* Card init *-->
                <div class="card">
                    <!-- Card header -->
                    <div class="card-header">
                        <!-- Surtitle -->
                        <h6 class="surtitle">Performance</h6>
                        <!-- Title -->
                        <h5 class="h3 mb-0">Total orders</h5>
                    </div>
                    <!-- Card body -->
                    <div class="card-body">
                        <div class="chart"><div class="chartjs-size-monitor" style="position: absolute; left: 0px; top: 0px; right: 0px; bottom: 0px; overflow: hidden; pointer-events: none; visibility: hidden; z-index: -1;"><div class="chartjs-size-monitor-expand" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:1000000px;height:1000000px;left:0;top:0"></div></div><div class="chartjs-size-monitor-shrink" style="position:absolute;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1;"><div style="position:absolute;width:200%;height:200%;left:0; top:0"></div></div></div>
                            <!-- Chart wrapper -->
                            <canvas id="chart-bars" class="chart-canvas chartjs-render-monitor" width="1722" height="700" style="display: block; height: 350px; width: 861px;"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <#include "../template/footer.ftl" />

    </div>
</div>
<#include "../template/scripts.ftl" />
</body>

</html>