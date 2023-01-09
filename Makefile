.PHONY: help reload show uninstall install evtest scan

DEVICE := $(shell find /dev/input/by-id -name 'usb-*NORWII*-kbd')

help:
	# usage: [sudo] make TARGET
	# targets:
	#
	#   reload     # rebuilds and reloads the udev hwdb
	#   show       # show installed files
	#   install    # install local hwdb files in system
	#   uninstall  # uninstall the hwdb files from system
	#   evtest     # run evtest to watch the DEVICE
	#   scan       # run evtest adn grep the scan codes
	#
	# DEVICE = $(DEVICE)

reload:
	systemd-hwdb update
	udevadm trigger

show:
	ls  /etc/udev/hwdb.d
	cat /etc/udev/hwdb.d/90-norwii-n95s.hwdb

uninstall:
	rm -f /etc/udev/hwdb.d/90-norwii-n95s.hwdb

install:
	cp 90-norwii-n95s.hwdb /etc/udev/hwdb.d

evtest:
	evtest $(DEVICE)

scan:
	# scanning for hex values...
	evtest $(DEVICE) | grep -io 'SCAN.*value.*'
