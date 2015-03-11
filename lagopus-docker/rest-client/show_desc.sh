#!/bin/sh
# get the desc stats of the switch
# GET /stats/desc/<dpid>

. ./topo.conf

dpid2decimal() {
    local macaddr=`echo $1 | cut -d '.' -f2`
    local str=
    local IFS=:
    for byte in ${macaddr}; do
        str="${str}${byte}"
    done
    echo "$(printf '%d' 0x${str})"
}

eval dpid=\${$1_DPID:-}
if [ "${dpid}" ]; then
    dpid_n=$(dpid2decimal ${dpid})
    curl -s -X GET http://REST:PORT/stats/desc/${dpid_n}
else
    echo "Usage: show_desc.sh <dpid>"
    exit 2
fi
