#!/usr/bin/env bash

NEXUS_HOME="$(cd "`dirname "$0"`/.."; pwd)"
DISTDIR="$NEXUS_HOME/build"

MAKE_TGZ=true # default tgz
MAKE_PIP=false
MAKE_R=false
NAME=none
APP_NAME=none
APP_VERSION=none
MVN="$MAVEN_HOME/bin/mvn"

function exit_with_usage {
  echo "make-tool.sh - tool for making binary"
  echo ""
  echo "usage:"
  cl_options="[--name] [--tgz] [--pip] [--r] [--mvn <mvn-command>]"
  echo "make-tool.sh $cl_options <maven build options>"
  echo ""
  exit 1
}

# Parse the app name and app version from the pom.xml
pom_xml=`cat ${NEXUS_HOME}/pom.xml`
for line in ${pom_xml}
do
    if [[ "$line" == "<artifactId>"*"</artifactId>" ]] && [[ "$APP_NAME" == "none" ]]; then
        v_right=${line#*>}
        APP_NAME=${v_right%%<*}
    elif [[ "$line" == "<version>"*"</version>" ]] && [[ "$APP_VERSION" == "none" ]]; then
        v_right=${line#*>}
        APP_VERSION=${v_right%%<*}
    fi
done

# Parse arguments
while (( "$#" )); do
  case $1 in
    --tgz)
      MAKE_TGZ=true
      ;;
    --pip)
      MAKE_PIP=true
      ;;
    --r)
      MAKE_R=true
      ;;
    --mvn)
      MVN="$2"
      shift
      ;;
    --name)
      NAME="$2"
      shift
      ;;
    --help)
      exit_with_usage
      ;;
    *)
      break
      ;;
  esac
  shift
done


if [ -z "$JAVA_HOME" ]; then
  # Fall back on JAVA_HOME from rpm, if found
  if [ $(command -v  rpm) ]; then
    RPM_JAVA_HOME="$(rpm -E %java_home 2>/dev/null)"
    if [ "$RPM_JAVA_HOME" != "%java_home" ]; then
      JAVA_HOME="$RPM_JAVA_HOME"
      echo "No JAVA_HOME set, proceeding with '$JAVA_HOME' learned from rpm"
    fi
  fi

  if [ -z "$JAVA_HOME" ]; then
    if [ `command -v java` ]; then
      # If java is in /usr/bin/java, we want /usr
      JAVA_HOME="$(dirname $(dirname $(which java)))"
    fi
  fi
fi

if [ -z "$JAVA_HOME" ]; then
  echo "Error: JAVA_HOME is not set, cannot proceed."
  exit -1
fi

if [ $(command -v git) ]; then
    GITREV=$(git rev-parse --short HEAD 2>/dev/null || :)
    if [ ! -z "$GITREV" ]; then
        GITREVSTRING=" (git revision $GITREV)"
    fi
    unset GITREV
fi


if [ ! "$(command -v "$MVN")" ] ; then
    echo -e "Could not locate Maven command: '$MVN'."
    echo -e "Specify the Maven command with the --mvn flag"
    exit -1;
fi

VERSION=$("$MVN" --version)
echo "MAVEN version is $VERSION"

if [ "$MAKE_TGZ" == "true" ]; then
  echo "Making $APP_NAME-$APP_VERSION.tgz"
else
  echo "Making nexus module of $APP_NAME-$VERSION in '$DISTDIR'..."
fi

# Build uber fat JAR
cd "$NEXUS_HOME"
export MAVEN_OPTS="${MAVEN_OPTS:--Xmx2g -XX:ReservedCodeCacheSize=512m}"

# build command
BUILD_COMMAND=("$MVN" -T 1C clean package -DskipTests $@)

# Actually build the jar
echo -e "\nBuilding with..."
echo -e "\$ ${BUILD_COMMAND[@]}\n"
"${BUILD_COMMAND[@]}"
#check maven build result, if failed will exit
if [ $? -eq 1 ]; then
    echo ""
    echo "ERROR:"
    echo "  BUILD $APP_NAME-$APP_VERSION FAILED!"
    exit 1
fi


# Make directories
rm -rf "$DISTDIR"
mkdir -p "$DISTDIR"/jars
mkdir -p "$DISTDIR"/lib
mkdir -p "$DISTDIR"/conf
mkdir -p "$DISTDIR"/logs
echo "Nexus module => $APP_NAME, version => $APP_VERSION built" > "$DISTDIR/RELEASE"
echo "Build flags: $@" >> "$DISTDIR/RELEASE"

# Copy jars and resources
if [[ -d ${NEXUS_HOME}"/target" ]]; then
    cp "$NEXUS_HOME"/target/*.jar "$DISTDIR"/jars/
fi
if [[ -d "${NEXUS_HOME}/src/main/resources" ]]; then
    cp -r "${NEXUS_HOME}"/src/main/resources/* "$DISTDIR"/conf/
fi
for e in `ls ${NEXUS_HOME}`
do
    module="$NEXUS_HOME/$e"
    if [[ -d ${module} ]] && [[ -d ${module}"/target" ]]; then
        cp "$module"/target/*.jar "$DISTDIR"/jars/
    fi

    if [[ -d ${module} ]] && [[ -d "${module}/src/main/resources" ]]; then
        cp -r "${module}"/src/main/resources/* "$DISTDIR"/conf/
    fi

    # copy files. sbin, bin, lib, resources..eg
    if [ -d "${module}/sbin" ]; then
        cp -r "${module}/sbin" "$DISTDIR"
    fi
    if [ -d "${module}/bin" ]; then
        cp -r "${module}/bin" "$DISTDIR"
    fi
    if [ -d "${module}/lib" ]; then
        cp -r "${module}/lib" "$DISTDIR"
    fi
done


# copy files. sbin, bin, lib, resources..eg
if [ -d "$NEXUS_HOME/sbin" ]; then
    cp -r "$NEXUS_HOME/sbin" "$DISTDIR"
fi
if [ -d "$NEXUS_HOME/bin" ]; then
    cp -r "$NEXUS_HOME/bin" "$DISTDIR"
fi
if [ -d "$NEXUS_HOME/lib" ]; then
    cp -r "$NEXUS_HOME/lib" "$DISTDIR"
fi
if [ -f "$NEXUS_HOME"/README.md ]; then
    cp "$NEXUS_HOME"/README.md "$DISTDIR"
fi

# make tgz
if [ "$MAKE_TGZ" == "true" ]; then
  TARDIR_NAME=${APP_NAME}"-"${APP_VERSION}
  TARDIR="$NEXUS_HOME/$TARDIR_NAME"
  rm -rf "$TARDIR"
  cp -r "$DISTDIR" "$TARDIR"
  tar czf "$TARDIR_NAME.tar.gz" -C "$NEXUS_HOME" "$TARDIR_NAME"
  rm -rf "$TARDIR"
fi

echo ""
echo "MAKE $APP_NAME-$APP_VERSION SUCCESS"
