#!/usr/bin/env bash
# 远程shell执行工具

USER=""
HOST=""
CMD=""

function exit_with_usage {
  echo "$? for execute the remote shell command"
  echo ""
  echo "usage:"
  cl_options="[-user] [-host] [-cmd]"
  echo "$? $cl_options"
  echo ""
  exit 1
}

# Parse arguments
while (( "$#" )); do
    case $1 in
    -user |--u)
        USER=$2
        shift
        ;;
    -host | --h)
        HOST=$2
        shift
        ;;
    -cmd | -c)
        CMD=$2
        shift
        ;;
    --help)
        exit_with_usage
        ;;
    *)
        exit_with_usage
        ;;
    esac
    shift
done

#execute the remote command
if [[ ! -z ${USER} ]] && [[ ! -z ${HOST} ]] && [[ ! -z ${CMD} ]]; then
    ssh ${USER}@${HOST} ${CMD}
else
    exit_with_usage
fi

