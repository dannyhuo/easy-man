#!/usr/bin/env bash
APP_HOME="$(cd "`dirname "$0"`/.."; pwd)"

#you can overwrite it
APP_NAME="none"
#you can overwrite it
APP_VERSION="none"
#you can overwrite it
APP_JAR="none"
#you can overwrite it
JAR_NAME="none"
#you can overwrite it
RUN_MODE=""

#you can overwrite it
JAVA="$JAVA_HOME/bin/java"
#you can overwrite it
PROFILE_PATH="-Dspring.conf.path=${APP_HOME}/conf"
#you can overwrite it
ADDITION_PROFILE_LOCATION="-Dspring.config.additional-location=${APP_HOME}/conf/"
#you can overwrite it
PROFILE_ACTIVE=""
#you can overwrite it
NEXUS_SPRING_OPTIONS=""
#you can overwrite it
JVM_OPTIONS="-server -Xms1024m -Xmx1024m -XX:PermSize=128M -XX:MaxNewSize=128m -XX:MaxPermSize=128m -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled"
LOAD_PATH="-Dloader.path=${APP_HOME}/conf/,${APP_HOME}/lib/"

v=test
ST_OK=0
ST_ER=1
NOT_RUNNING='N'


# 引入环境变量shell
sh nexus-env.sh


#userage
function print_help(){
    echo "  For option --help|-h to print the usage"
    echo "  For option --app|-name to point the service name"
    echo "  For option --jar|-j to point the service jar's path"
    echo "  For option --v|-v to point action. run, start, stop, restart, status, monitor eg"
    echo "  For option --config|-c of to point the config path.  application.properties eg"
    echo "  For option --mode|-m of run mode. dev,local,prod,test eg"
}

# Parse the parameter
while test -n "$1"; do
    case "$1" in
    --help|-h)
        print_help
        exit ${ST_OK}
    ;;
    --app|-name)
        APP_NAME=$2
        shift
    ;;
    --jar|-j)
        APP_JAR=$2
        if [ ${APP_NAME} == "none" ]; then
            JAR_NAME=${APP_JAR%%/*}
            APP_NAME=${name%%.jar*}
        fi
        shift
    ;;
    --config|-c)
        PROFILE_LOCATION=$2
        RUN_MODE=""
        shift
    ;;
    --mode|-m)
        RUN_MODE=$2
        shift
    ;;
    --v|-v)
        v=$2
        shift
    ;;
    *)
        echo "Unknown parameter: $1"
        print_help
        exit ${ST_ER}
    ;;
    esac
    shift
done


# Find the jars by  default, if you not point it
if [ ${APP_JAR} == "none" ]; then
    if [ ! -d ${APP_HOME}/jars ]; then
        echo "ERROR:"
        echo "  The jars directory not found, which must be exists!"
        echo "  ${APP_HOME}/jars"
        exit ${ST_ER}
    fi
    cd ${APP_HOME}/jars
    if [[ `find . -name '*.jar' |wc -l` -eq 1 ]]; then
        JAR_NAME=`ls *.jar`
        APP_JAR=${APP_HOME}/jars/${JAR_NAME}
        APP_NAME=${JAR_NAME%%.*}
    elif [[ `find . -name '*server*.jar' |wc -l` -eq 1 ]]; then
        JAR_NAME=`ls *server*.jar`
        APP_JAR=${APP_HOME}/jars/${JAR_NAME}
        APP_NAME=${JAR_NAME%%.jar*}
    elif [[ `find . -name '*admin*.jar' |wc -l` -eq 1 ]]; then
        JAR_NAME=`ls *admin*.jar`
        APP_JAR=${APP_HOME}/jars/${JAR_NAME}
        APP_NAME=${JAR_NAME%%.jar*}
    else
        echo "ERROR:"
        echo "  The jars directory as follows is empty or duplicate jars!"
        echo "  ${APP_HOME}/jars"
        exit ${ST_ER}
    fi
    cd ${APP_HOME}

    if [ ${APP_JAR} == "none" ]; then
        echo "ERROR:"
        echo "  Not founded server's jar, you can point it by --jar| -j option, you can vi $0 to set it."
        exit ${ST_ER}
    fi
fi


# set spring.profiles.active
if [ "$RUN_MODE" != "" ]; then
    PROFILE_ACTIVE="-Dspring.profiles.active=$RUN_MODE"
fi

#CONFIG=${PROFILE_LOCATION#*=}
#if [ ! -f ${CONFIG} ]; then
#    yml=${CONFIG%%.properties*}.yml
#    if [ -f "$yml" ]; then
#        PROFILE_LOCATION=${yml}
#        echo ""
#        echo "Use the config file:"
#        echo "  $PROFILE_LOCATION"
#    else
#        echo ""
#        echo "Config file not found:"
#        echo "   ${PROFILE_LOCATION#*=}"
#        exit ${ST_ER}
#    fi
#fi

#启动服务，如果服务已启动，提示不可重复start
function start_service(){
    local pid=$(is_running)
    if [[ ${pid} == "$NOT_RUNNING" ]]; then
        echo "Service of $APP_NAME is starting......"
        nohup "$JAVA" ${JVM_OPTIONS} -jar ${LOAD_PATH} ${PROFILE_PATH} ${PROFILE_ACTIVE} ${NEXUS_SPRING_OPTIONS} ${ADDITION_PROFILE_LOCATION} ${APP_JAR} >> ${APP_HOME}/logs/nohup.out 2>&1 &
        sleep 3s
        echo "Service of $APP_NAME(pid=$(get_pid)) started!"
    else
        echo "Service of $APP_NAME(pid=$(get_pid)) is running, can't start repeat!"
    fi
}


function run(){
    local pid=$(is_running)
    if [[ ${pid} == "$NOT_RUNNING" ]]; then
        "$JAVA" ${JVM_OPTIONS} -jar ${LOAD_PATH} ${PROFILE_PATH} ${PROFILE_ACTIVE} ${ADDITION_PROFILE_LOCATION} ${APP_JAR} >> ${APP_HOME}/logs/nohup.out 2>&1 &
    else
        echo "Service of $APP_NAME(pid=$pid) is running, can't start repeat!"
    fi
}

#重启
function restart_service(){
    stop_service
    start_service
}


#停止，如果服务已启动，则停止服务
function stop_service(){
    local pid=$(is_running)
    if [[ ${pid} == "$NOT_RUNNING" ]]; then
        echo "Service $APP_NAME is not running!"
    else
        echo "Service of $APP_NAME(pid=$pid) is stopping......"
        kill ${pid}
        sleep 3s
        echo "Service of $APP_NAME(pid=$pid) stopped！"
    fi
}


#检查服务是否已启动
#未启动，返回NOT_RUNNING标记
#已启动，返回服务PID
function is_running(){
    local pid=$(get_pid)
    local rtv=${NOT_RUNNING}
    if [ -n "$pid" ];
      then
        rtv=${pid}
    fi
    echo ${rtv}
}

##获取PID
function get_pid(){
    pid=`jps -lm |awk /${JAR_NAME}/'{print $1}'`
    echo "$pid"
}


#检查
function status(){
    echo ""
    echo "===================================="
    local pid=$(is_running)
    if [[ ${pid} == "$NOT_RUNNING" ]]; then
        echo "Status : Dead!"
    else
        echo "Status : Running[$pid]"
    fi
    echo "===================================="
}

# if daemon is dead, will start it
function monitor(){
    local pid=$(is_running)
    if [[ ${pid} == "$NOT_RUNNING" ]]; then
        echo "$(date): Daemon is dead, will start it auto."
        start_service
    fi
}

if [[ "$v" = "start" ]]; then
    start_service
elif [[ "$v" = "run" ]]; then
    run
elif [[ "$v" = "stop" ]]; then
    stop_service
elif [[ "$v" = "restart" ]]; then
    restart_service
elif [[ "$v" = "status" ]]; then
    status
elif [[ "$v" = "monitor" ]]; then
    monitor
elif [ -z "$v" ]; then
    echo "The option of -v is must."
    print_help
    exit ${ST_OK}
else
    echo "Unknown value $v for option -v"
    print_help
    exit ${ST_ER}
fi
