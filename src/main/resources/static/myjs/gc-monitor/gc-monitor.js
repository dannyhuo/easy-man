
const gc = ["s0c","s1c","s0u","s1u","ec","eu","oc","ou","mc","mu","ccsc","ccsu","ygc","ygct","fgc","fgct","gct"];

const backgroundColor = [
    'rgba(255, 99, 132, 0.2)',
    'rgba(54, 162, 235, 0.2)',
    'rgba(255, 206, 86, 0.2)',
    'rgba(75, 192, 192, 0.2)',
    'rgba(153, 102, 255, 0.2)',
    'rgba(133, 112, 255, 0.2)',
    'rgba(153, 132, 155, 0.2)',
    'rgba(103, 102, 255, 0.2)',
    'rgba(153, 102, 201, 0.2)',
    'rgba(153, 131, 255, 0.2)',
    'rgba(153, 92, 205, 0.2)',
    'rgba(253, 162, 205, 0.2)',
    'rgba(43, 12, 105, 0.2)',
    'rgba(13, 132, 105, 0.2)',
    'rgba(53, 142, 105, 0.2)',
    'rgba(123, 92, 105, 0.2)',
    'rgba(255, 159, 64, 0.2)'
];
const borderColor = [
    'rgba(255, 99, 132, 2)',
    'rgba(54, 162, 235, 2)',
    'rgba(255, 206, 86, 2)',
    'rgba(75, 192, 192, 2)',
    'rgba(153, 102, 255, 2)',
    'rgba(133, 112, 255, 2)',
    'rgba(153, 132, 155, 2)',
    'rgba(103, 102, 255, 2)',
    'rgba(153, 102, 201, 2)',
    'rgba(153, 131, 255, 2)',
    'rgba(153, 92, 205, 2)',
    'rgba(253, 162, 205, 2)',
    'rgba(43, 12, 105, 2)',
    'rgba(13, 132, 105, 2)',
    'rgba(53, 142, 105, 2)',
    'rgba(123, 92, 105, 2)',
    'rgba(255, 159, 64, 2)'
];

const borderWidth = 1;

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

init();