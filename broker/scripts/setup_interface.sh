#!/bin/bash

TUNNEL_ID="$1"
INTERFACE="$3"
MTU="$4"
FROM_IP="$5"
TUNNEL_UUID="$6"

. /opt/tunneldigger/broker/scripts/bridge_functions.sh

# Set the interface to UP state
ip link set dev $INTERFACE up mtu $MTU

# Add the interface to our bridge
ensure_bridge digger${MTU}
brctl addif digger${MTU} $INTERFACE

