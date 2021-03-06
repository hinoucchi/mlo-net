#!/bin/sh
# show links of the switch
# GET /v1.0/topology/links/<dpid>

. ./topo.conf

dpid2decimal() {
    local macaddr=`echo $1 | cut -d '.' -f2`
    local str=
    local IFS=:
    for byte in ${macaddr}; do
        str="${str}${byte}"
    done
    echo "$(printf '%016x' ${str})"
}

if [ "$1" ]; then
    eval dpid=\${$1_DPID:-}
    if [ "${dpid}" ]; then
        dpid_n=$(dpid2decimal ${dpid})
        curl -s -X GET http://REST:PORT/v1.0/topology/links/${dpid_n}
    else
        echo "Usage: show_links.sh [<dpid>]"
    fi
else
    curl -s -X GET http://REST:PORT/v1.0/topology/links
fi
