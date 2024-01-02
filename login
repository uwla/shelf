#!/bin/sh

# start ssh-agent (it remembers passphrases of ssh keys).
if [ -z "$(pidof ssh-agent)" ]; then
	[ -f /usr/bin/ssh-agent ] && eval "$(ssh-agent)" && echo ssh-agent started
fi

# start DBUS and export some variables to avoid cluttering home dir.
if [ -z "${DBUS_SESSION_BUS_PID}" ]; then
	export $(dbus-launch) && echo dbus launched
  export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus
fi
