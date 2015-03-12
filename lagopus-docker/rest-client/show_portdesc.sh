#!/bin/sh
# get ports description of the switch
# GET /stats/portdesc/<dpid>

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
    curl -s -X GET http://REST:PORT/stats/portdesc/${dpid_n}
else
    echo "Usage: show_portdesc.sh <dpid>"
    exit 2
fi
