#!/bin/bash

configdir="/etc/rtslib-fb-target"
configfile="${configdir}/saveconfig.json"

set -e

targetcli /iscsi create

targetcli saveconfig

if [[ ! -d ${configdir} || ! -f ${configfile} ]]
then
    echo "targetcli should use $configdir"
    exit 1
fi

targetcli clearconfig confirm=True

exit 0
