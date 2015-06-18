#!/bin/bash
### BEGIN INIT INFO
# Provides:          net-speeder
# Required-Start:    $local_fs $network $remote_fs $syslog
# Required-Stop:     $local_fs $network $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: net-speeder 
# Description:       net-speeder
### END INIT INFO

# Author: liu shiwei <liushiwei@gmail.com>

# Do NOT "set -e"

# PATH should only include /usr/* if it runs after the mountnfs.sh script
PATH=/sbin:/usr/sbin:/bin:/usr/bin
DESC="net-speeder"
NAME=net-speeder
DAEMON=/usr/sbin/net-speeder
DAEMON_ARGS=""
PIDFILE=/var/run/$NAME.pid
SCRIPTNAME=/etc/init.d/$NAME

# Exit if the package is not installed
[ -x "$DAEMON" ] || exit 0

# Read configuration variable file if it is present
[ -r /etc/default/$NAME ] && . /etc/default/$NAME

 [ "$INTERFACE"x != "x" ] || exit 0 
 [ "$FILTER"x != "x" ] || FILTER="ip"

if [ "${INTERFACE:0:2}" = "ve" ] ; then
 DAEMON=/usr/sbin/venet-speeder
fi


case "$1" in
  start|restart)
	killall $DAEMON 2>/dev/null
	if [ "$RUN_DAEMON"x = "true"x ] ; then
	nohup $DAEMON $INTERFACE "$FILTER" >/dev/null 2>/dev/null &
	fi
	;;
  stop)
	killall $DAEMON 2>/dev/null
	;;
  *)
	echo "Usage: $SCRIPTNAME {start|stop|restart}" >&2
	exit 3
	;;
esac

:
