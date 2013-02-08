#!/bin/sh

[ "$(paxctl -v /usr/bin/ruby 2>/dev/null)" ] || {
	sudo paxctl -cm /usr/bin/ruby
}

sudo systemctl --system daemon-reload

sudo linux-pax-flags.rb $@
