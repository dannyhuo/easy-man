
const gc = ["s0c","s1c","s0u","s1u","ec","eu","oc","ou","mc","mu","ccsc","ccsu","ygc","ygct","fgc","fgct","gct"];

const GC_INFO = [
    {
        "label":["s0c","s0u","s1c","s1u","ec","eu"],
        "name":"young",
        "axisIndex":0,
        "yUnit" : "YOUNG(KB)",
        "data":[]
    },
    {
        "label":["oc","ou","mc","mu","ccsc","ccsu"],
        "name":"old",
        "axisIndex":1,
        "yUnit" : "OLD(KB)",
        "data":[]
    },
    {
        "label":["ygc","fgc"],
        "name":"times",
        "axisIndex":2,
        "yUnit" : "GC次数",
        "data":[]
    },
    {
        "label":["ygct","fgct","gct"],
        "name":"time",
        "axisIndex":3,
        "yUnit" : "GC时长(秒)",
        "data":[]
    }
];


const borderWidth = 1;


/**
 * 向container中追加card
 * @param parentId 父容器ID
 * @param id id
 * @param cardName card名称
 * @returns {HTMLElement}
 */
function appendChart(parentId, id, cardName) {
    const container = document.getElementById(parentId);

    const card = document.createElement("DIV");
    container.appendChild(card);
    card.id = "card_" + id;
    card.className = "card";
    //Add header by innerHTML
    card.innerHTML = "<!-- Card header -->" +
        "<div class=\"card-header border-0\">" +
        "   <h3 class=\"mb-0\">"+cardName+"</h3>" +
        "</div>";

    const chartContent = document.createElement("DIV");
    card.appendChild(chartContent);
    chartContent.className = "card-body";
    chartContent.id = "chart_" + id;
    chartContent.innerHTML = "";

    return chartContent;
}


/**
 * 向container中追加card
 * @param parentId 父容器ID
 * @param id id
 * @param cardName card名称
 * @returns {HTMLElement} card element
 */
function appendCard(parentId, id, cardName) {
    const container = document.getElementById(parentId);

    const card = document.createElement("DIV");
    container.appendChild(card);
    card.id = "card_" + id;
    card.className = "card row";
    //Add header by innerHTML
    card.innerHTML = "<!-- Card header -->" +
        "<div class=\"card-header border-0\">" +
        "   <h3 class=\"mb-0\">"+cardName+"</h3>" +
        "</div>";

    return card;
}

/**
 * 向card中追加body
 * @param id
 * @param card
 * @returns {HTMLElement} card body element
 */
function appendCardBody(id, card, height) {
    const cardBody = document.createElement("DIV");
    card.appendChild(cardBody);
    cardBody.className = "card-body";
    cardBody.id = "body_" + id;
    cardBody.style.height = height;
    cardBody.innerHTML = "";
    return cardBody;
}


/**
 * 加载数据并绘制echarts图表
 */
function loadEcharts() {
    $.ajax({
        url : "/gc/monitor/loadData",
        async : true,
        type : "GET",
        success : function (response) {
            //循环每个服务
            for (let i = 0; i < response.length; i++) {
                const service = response[i];
                const gcDetails = service["gcDetails"];

                //创建card
                const cardName = service["serviceName"];
                const card = appendCard("echarts_container", service["serviceId"], cardName)
                //循环创建不同的card body
                for (let j = 0; j < GC_INFO.length; j++) {
                    const cardBody = appendCardBody(service["serviceId"], card, "300px");
                    cardBody.style.width = "95%";
                    const myChart = echarts.init(cardBody);
                    const series = [];

                    //时间轴
                    const timeAxis = [];

                    const labels = GC_INFO[j]["label"];
                    for (let k = 0; k < labels.length; k++) {
                        const curData = [];
                        const curName = labels[k];
                        for (let m = 0; m < gcDetails.length; m++) {
                            const detail = gcDetails[m];
                            if (k == 0) {
                                //设置时间轴
                                timeAxis.push(detail["createTime"]);
                            }

                            //填充数据
                            curData.push(detail[curName]);
                        }

                        series.push({
                            name:curName,
                            type:'line',
                            symbolSize: 8,
                            hoverAnimation: false,
                            data : curData
                        });
                    }

                    let option = {
                        // title: {
                        //     //text: service["serviceName"],
                        //     subtext: GC_INFO[j].name,
                        //     x: 'left'
                        // },
                        tooltip: {
                            trigger: 'axis',
                            axisPointer: {
                                animation: false
                            }
                        },
                        legend: {
                            data: labels,
                            x: 'center'
                        },
                        dataZoom: [
                            {
                                show: true,
                                realtime: true
                            },
                            {
                                type: 'inside',
                                realtime: true
                            }
                        ],
                        // toolbox: {
                        //     feature: {
                        //         dataZoom: {
                        //             yAxisIndex: 'none'
                        //         },
                        //         restore: {},
                        //         saveAsImage: {}
                        //     }
                        // },
                        axisPointer: {
                            link: {xAxisIndex: 'all'}
                        },
                        xAxis: [
                            {
                                type: 'category',
                                //inverse: true,
                                data: timeAxis.map(function (t) {
                                    return t.replace("T", "\n");
                                })
                            }
                        ],
                        yAxis: [
                            {type: 'value', name: GC_INFO[j].yUnit}
                        ],

                        series: series
                    };



                    myChart.setOption(option, true)

                }




            }
        },

        error : function () {

        }
    })




}

function init() {
    const chartParent = document.getElementById("chart_content");
    chartParent.innerHTML = "";
    $.ajax({
        url : "/gc/monitor/loadData",
        async : true,
        type : "GET",
        success : function (response) {
            for (let i = 0; i < response.length; i++) {
                const service = response[i];
                const gcDetails = service["gcDetails"];
                const id = "chart_" + service["serviceId"];
                const div = document.createElement("DIV");
                div.id = "div_" + id;
                div.className = "row";
                chartParent.appendChild(div);
                div.innerHTML = "<canvas id=\"" + id + "\" width=\"1800px\" height=\"600\"></canvas>";

                const labels = [];
                const datasets = [];
                for (let k = 0; k < gc.length; k++) {
                    const name = gc[k];
                    const data = [];
                    for (let j = 0; j < gcDetails.length; j++) {
                        const detail = gcDetails[j];
                        if (k == 0) {
                            labels.push(detail["createTime"]);
                        }
                        data.push(detail[name]);
                    }

                    datasets.push({
                        label : name,
                        data : data,
                        fillColor: "rgba("+randomInt(0, 200)+","+randomInt(0, 200)+","+randomInt(0, 200)+", 0.2)",
                        strokeColor: "rgba("+randomInt(0, 200)+","+randomInt(0, 200)+","+randomInt(0, 200)+", 0.5)",
                        pointColor: "rgba("+randomInt(0, 200)+","+randomInt(0, 200)+","+randomInt(0, 200)+", 0.75)",
                        pointStrokeColor: "#fff",
                        pointHighlightFill: "#fff",
                        pointHighlightStroke: "rgba("+randomInt(0, 200)+","+randomInt(0, 200)+","+randomInt(0, 200)+", 1)",
                        borderWidth : borderWidth
                        //backgroundColor : backgroundColor,
                        //borderColor : borderColor,
                        //borderWidth : borderWidth
                    })
                }

                //绘制canvas
                const ctx = document.getElementById(id).getContext('2d');
                new Chart(ctx, {
                    type: 'line',
                    data: {
                        labels: labels,
                        datasets: datasets
                    },
                    options: {
                        scales: {
                            yAxes: [{
                                ticks: {
                                    beginAtZero:true
                                }
                            }]
                        }
                    }
                });


            }
        },
        
        error : function () {
            
        }
    })
}



function initEcharts() {
    const chartParent = document.getElementById("chart_content");
    chartParent.innerHTML = "";
    $.ajax({
        url : "/gc/monitor/loadData",
        async : true,
        type : "GET",
        success : function (response) {
            for (let i = 0; i < response.length; i++) {
                const service = response[i];
                const gcDetails = service["gcDetails"];
                const id = "chart_" + service["serviceId"];
                const div = document.createElement("DIV");
                div.id = "div_" + id;
                div.className = "row";
                div.style.height="600px";
                div.style.width="100%";
                chartParent.appendChild(div);
                div.innerHTML = "";

                const myChart = echarts.init(div);

                const labels = [];
                const series = [];
                for (let k = 0; k < gc.length; k++) {
                    const name = gc[k];
                    const data = [];
                    for (let j = 0; j < gcDetails.length; j++) {
                        const detail = gcDetails[j];
                        if (k == 0) {
                            labels.push(detail["createTime"]);
                        }
                        data.push(detail[name]);
                    }

                    series.push({
                        name : name,
                        type : "line",
                        data : data,
                        smooth : true,
                        stack: '总量'
                    })
                }


                let option = {
                    title: {
                        text: service["serviceName"],
                        x : "right"
                    },
                    tooltip : {
                        trigger: 'axis',
                    },
                    legend: {
                        data:gc,
                        x : "center"
                    },
                    toolbox: {
                        feature: {
                            saveAsImage: {}
                        }
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        bottom: '3%',
                        containLabel: true
                    },
                    xAxis : [
                        {
                            type : 'category',
                            boundaryGap : false,
                            data : labels
                        }
                    ],
                    yAxis : [
                        {
                            type : 'value'
                        }
                    ],
                    series : series
                };


                myChart.setOption(option, true)

            }
        },

        error : function () {

        }
    })
}



function initEcharts2() {
    const chartParent = document.getElementById("chart_content");
    chartParent.innerHTML = "";
    $.ajax({
        url : "/gc/monitor/loadData",
        async : true,
        type : "GET",
        success : function (response) {
            for (let i = 0; i < response.length; i++) {
                const service = response[i];
                const gcDetails = service["gcDetails"];
                const id = "chart_" + service["serviceId"];
                const div = document.createElement("DIV");
                div.id = "div_" + id;
                div.className = "row";
                div.style.height="450px";
                div.style.width="100%";
                chartParent.appendChild(div);
                div.innerHTML = "";

                const myChart = echarts.init(div);

                const labels = [];
                const series = [];
                for (let k = 0; k < gc.length; k++) {
                    const name = gc[k];
                    const data = [];
                    for (let j = 0; j < gcDetails.length; j++) {
                        const detail = gcDetails[j];
                        if (k == 0) {
                            labels.push(detail["createTime"]);
                        }
                        data.push(detail[name]);
                    }

                    series.push({
                        name : name,
                        type : "line",
                        data : data,
                        yAxisIndex:name.lastIndexOf("u") != 0 ?1:0,
                        smooth : true,
                        stack: '总量'
                    })
                }


                let option = {
                    title : {
                        //text: service["serviceName"]+'GC信息',
                        subtext: service["serviceName"]+'GC信息',
                        x: 'center',
                        align: 'right'
                    },
                    grid: {
                        bottom: 80
                    },
                    toolbox: {
                        feature: {
                            dataZoom: {
                                yAxisIndex: 'none'
                            },
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    tooltip : {
                        trigger: 'axis',
                        axisPointer: {
                            type: 'cross',
                            animation: false,
                            label: {
                                backgroundColor: '#505765'
                            }
                        }
                    },
                    legend: {
                        data:gc,
                        x: 'center'
                    },
                    dataZoom: [
                        {
                            show: true,
                            realtime: true,
                            start: 65,
                            end: 85
                        },
                        {
                            type: 'inside',
                            realtime: true,
                            start: 65,
                            end: 85
                        }
                    ],
                    xAxis : [
                        {
                            type : 'category',
                            boundaryGap : false,
                            axisLine: {onZero: false},
                            data :labels.map(function (str) {
                                return str.replace('T', '\n')
                            })
                        }
                    ],
                    yAxis: [
                        {
                            name: '内存(kb)',
                            type: 'value'
                        },
                        {
                            name: '百分比(%)',
                            nameLocation: 'start',
                            type: 'value',
                            inverse: name.lastIndexOf("u") != 0 ?true:false,
                        }
                    ],
                    series: series,
                    //backgroundColor : "black",
                    borderWidth : borderWidth
                };



                myChart.setOption(option, true)

            }
        },

        error : function () {

        }
    })
}



function initEcharts3() {


    const chartParent = document.getElementById("chart_content");
    chartParent.innerHTML = "";
    $.ajax({
        url : "/gc/monitor/loadData",
        async : true,
        type : "GET",
        success : function (response) {
            for (let i = 0; i < response.length; i++) {
                const service = response[i];
                const gcDetails = service["gcDetails"];
                const id = "chart_" + service["serviceId"];
                const div = document.createElement("DIV");
                div.id = "div_" + id;
                div.className = "row";
                div.style.height="450px";
                div.style.width="100%";
                chartParent.appendChild(div);
                div.innerHTML = "";

                const myChart = echarts.init(div);

                const labels = [];
                const series = [];
                for (let k = 0; k < gc.length; k++) {
                    const name = gc[k];
                    const data = [];
                    for (let j = 0; j < gcDetails.length; j++) {
                        const detail = gcDetails[j];
                        if (k == 0) {
                            labels.push(detail["createTime"]);
                        }
                        data.push(detail[name]);
                    }

                    const axisIndex = name.lastIndexOf("t") != 0 ?1:0;
                    series.push({
                        name:name,
                        type:'line',
                        xAxisIndex: axisIndex,
                        yAxisIndex: axisIndex,
                        symbolSize: 8,
                        hoverAnimation: false,
                        data : data
                    })
                }


                let option = {
                    title: {
                        //text: service["serviceName"],
                        subtext: service["serviceName"],
                        x: 'center'
                    },
                    tooltip: {
                        trigger: 'axis',
                        axisPointer: {
                            animation: false
                        }
                    },
                    legend: {
                        data: gc,
                        x: 'left'
                    },
                    toolbox: {
                        feature: {
                            dataZoom: {
                                yAxisIndex: 'none'
                            },
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    axisPointer: {
                        link: {xAxisIndex: 'all'}
                    },
                    dataZoom: [
                        {
                            show: true,
                            realtime: true,
                            start: 30,
                            end: 70,
                            xAxisIndex: [0, 1]
                        },
                        {
                            type: 'inside',
                            realtime: true,
                            start: 30,
                            end: 70,
                            xAxisIndex: [0, 1]
                        }
                    ],
                    grid: [{
                        left: 50,
                        right: 50,
                        height: '35%'
                    }, {
                        left: 50,
                        right: 50,
                        top: '55%',
                        height: '35%'
                    }],
                    xAxis: [
                        {
                            type: 'category',
                            boundaryGap: false,
                            axisLine: {onZero: true},
                            data: labels.map(function (t) {
                                return t.replace("T", "\n");
                            })
                        },
                        {
                            gridIndex: 1,
                            type: 'category',
                            boundaryGap: false,
                            axisLine: {onZero: true},
                            data: labels.map(function (t) {
                                return t.replace("T", "\n");
                            }),
                            position: 'top'
                        }
                    ],
                    yAxis: [
                        {
                            name: '内存(KB)',
                            type: 'value',
                            max: 500
                        },
                        {
                            gridIndex: 1,
                            name: '时间(秒)',
                            type: 'value',
                            inverse: true
                        }
                    ],
                    series: series
                }



                myChart.setOption(option, true)

            }
        },

        error : function () {

        }
    })




}



/**
 * 生成指定范围内的随机整数
 * @param minNum 最小值
 * @param maxNum 最大值
 * @returns {*}
 */
function randomInt(minNum, maxNum) {
    if (maxNum <= minNum) {
        return minNum;
    }
    return parseInt(Math.random() * (maxNum - minNum + 1) + minNum, 10);
}

loadEcharts();