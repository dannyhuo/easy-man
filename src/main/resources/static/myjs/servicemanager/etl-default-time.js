
/**
 * 初始化etl默认时间规则
 * @returns {{startDate: string, startHour: *, startMinute: *}}
 */
function defaultTimeRule() {
    const MAX_M = 60;
    const HOUR_SPLIT=6;//6点作为分割线

    let startDate;//开始时间
    let startHour;//开始小时
    let startMinute;//开始分钟
    let today = false;

    const now = new Date();
    const tmpPrefix = now.getFullYear() + "-" + LPAD((now.getMonth() + 1),2,0) + "-";
    if (now.getHours() > HOUR_SPLIT) {
        //当前大于6点，默认隔天执行
        startDate = tmpPrefix + (now.getDate() + 1)
    } else {
        startDate = tmpPrefix + now.getDate();
        today = true;
    }

    startHour = randomInt(0, today? now.getHours() : HOUR_SPLIT);
    startMinute = randomInt(today && startHour == now.getHours() ? 10 : 0, MAX_M);


    return {"startDate":startDate,"startHour":startHour,"startMinute":startMinute};

}

/**
 * 字符串补位
 * @param s 字符串
 * @param l 固定长度
 * @param r 不够固定长度在前补的字符
 * @returns {*}
 * @constructor
 */
function LPAD(s, l, r) {
    if (typeof(s) == "undefined" || typeof(r) == "undefined") {
        return s;
    }
    s = typeof(s) == "number" ? ("" + s) : s;
    r = typeof(r) == "number" ? ("" + r) : r;
    if (s && typeof(l) == "number" && r) {
        let len = s.length;
        if (len < l) {
            let itv = l - len;
            for (let i = 0; i < itv; i++) {
                s = r + s;
            }
        }
    }
    return s;
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
