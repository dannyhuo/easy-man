
const INFO = [
    {
        "label":["total","used","free"],
        "name":"内存",
        "axisIndex":0,
        "yUnit" : "Memmory(KB)",
        "data":[]
    },
    {
        "label":["shared","buffCache","available"],
        "name":"buffer",
        "axisIndex":0,
        "yUnit" : "Buffer(KB)",
        "data":[]
    },
    {
        "label":["swapTotal","swapUsed","swapFree"],
        "name":"swap",
        "axisIndex":1,
        "yUnit" : "Swap(KB)",
        "data":[]
    }
];

const smooth = true;

const borderWidth = 1;

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
        url : "/node-memory/monitor/loadData",
        async : true,
        type : "GET",
        success : function (response) {
            //循环每个服务
            for (let i = 0; i < response.length; i++) {
                const node = response[i];
                const memorys = node["nodeMemories"];

                //创建card
                const cardName = node["nodeName"];
                const card = appendCard("echarts_container", node["nodeId"], cardName)
                //循环创建不同的card body
                for (let j = 0; j < INFO.length; j++) {
                    const cardBody = appendCardBody(node["nodeId"], card, "300px");
                    cardBody.style.width = "95%";
                    const myChart = echarts.init(cardBody);
                    const series = [];

                    //时间轴
                    const timeAxis = [];

                    const labels = INFO[j]["label"];
                    for (let k = 0; k < labels.length; k++) {
                        const curData = [];
                        const curName = labels[k];
                        for (let m = 0; m < memorys.length; m++) {
                            const memory = memorys[m];
                            if (k == 0) {
                                //设置时间轴
                                timeAxis.push(memory["createTime"]);
                            }

                            //填充数据
                            curData.push(memory[curName]);
                        }

                        series.push({
                            name:curName,
                            type:'line',
                            symbolSize: 8,
                            hoverAnimation: false,
                            smooth : smooth,
                            data : curData
                        });
                    }

                    let option = {
                        // title: {
                        //     //text: service["serviceName"],
                        //     subtext: INFO[j].name,
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
                            {type: 'value', name: INFO[j].yUnit}
                        ],

                        series: series
                    };



                    myChart.setOption(option, true)

                }

            }
        },

        error : function () {

        }
    });

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