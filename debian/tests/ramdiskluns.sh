#!/bin/bash

set -e

targetcli /backstores/ramdisk create lun01 10240k

targetcli /backstores/ramdisk create lun02 50m

targetcli /iscsi create

iqn=$(targetcli /iscsi/ ls . 1 | tail -1 | awk '{print $2}')

targetcli /iscsi/${iqn}/tpg1/luns create lun=lun01 /backstores/ramdisk/lun01

targetcli /iscsi/${iqn}/tpg1/luns create lun=lun02 /backstores/ramdisk/lun02

targetcli clearconfig confirm=True

exit 0
