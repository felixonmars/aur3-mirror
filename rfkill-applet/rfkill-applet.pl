#!/usr/bin/env perl
#RFKill-Applet (Harvie 2oo9)

use strict;
use Gtk2 -init;

my $rfkill = '/sys/class/rfkill/rfkill*/state';
#my $rfkill = '/sys/devices/*/*/*/rfkill/rfkill*/state';
my $icon_e = 'gnome-dev-wavelan'; #enabled
my $icon_d = 'emblem-unreadable'; #disabled

my $statusicon = Gtk2::StatusIcon->new();
#$statusicon->signal_connect(activate => sub { Gtk2->main_quit; }); #exit on click...

my $state = -1;
$SIG{'ALRM'} = sub {
	my $last = $state;
	$state = `head -c 1 $rfkill 2> /dev/null`;
	if($state != $last) {
		if($state == 1) {
			$statusicon->set_from_icon_name($icon_e);
			$statusicon->set_tooltip_text('Radio enabled');
		} else {
			$statusicon->set_from_icon_name($icon_d);
			$statusicon->set_tooltip_text('Radio disabled');
		}
	}
	alarm(1);
};
alarm(1);

Gtk2->main;


