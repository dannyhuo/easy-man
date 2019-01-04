#!/usr/bin/env bash
APP_HOME="$(cd "`dirname "$0"`/.."; pwd)"

#You can set
#APP_NAME="none"

#You can set
#APP_VERSION="none"

#You can set
#APP_JAR="none"

#You can set
#JAR_NAME="none"

#You can set
#RUN_MODE=""

#You can set。example: -Dspring.profiles.active=dev -Dserver.port=8081 will overwrite the spring configs
#NEXUS_SPRING_OPTIONS=""

#You can set
#JVM_OPTIONS="-server -Xms1024m -Xmx1024m -XX:PermSize=128M -XX:MaxNewSize=128m -XX:MaxPermSize=128m -XX:+CMSClassUnloadingEnabled -XX:+CMSPermGenSweepingEnabled"

# You can set
#JAVA="$JAVA_HOME/bin/java"

# You can overwrite it
ADDITION_PROFILE_LOCATION="-Dspring.config.additional-location=${APP_HOME}/conf/"

# You can overwrite it
LOAD_PATH="-Dloader.path=${APP_HOME}/conf/,${APP_HOME}/lib/"
