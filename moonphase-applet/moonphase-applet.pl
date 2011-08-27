#!/usr/bin/env perl
#MoonPhase-Applet (Harvie 2oo9)

use strict;
use warnings;
use Astro::MoonPhase;
use Gtk2 -init;

my $icons = '/usr/share/icons/moonphase-icons'; #directory with moon phase icons

sub timediff {
	my $t = $_[0];
	my $days = int($t/(60*60*24)); $t %=(60*60*24);
	my $hours = int($t/(60*60)); $t %=(60*60);
	my $mins = int($t/(60)); $t %=(60);
	return $days."d ".$hours."h ".$mins."m ".$t."s";
}


my $statusicon = Gtk2::StatusIcon->new();
#$statusicon->signal_connect(activate => sub { Gtk2->main_quit; }); #exit on click...

opendir(my $dir,$icons);
	my @filenames = readdir($dir);
	closedir($dir);

@filenames = sort(@filenames); shift(@filenames); shift(@filenames); #remove . and ..
#@filenames = sort(sub {$b cmp $a}, @filenames); pop(@filenames); pop(@filenames); #reversed

my @phase_name = ("NEW MOON", "FIRST QUARTER", "FULL MOON", "LAST QUARTER");

$SIG{'ALRM'} = sub {
	my $time = time(); #seconds_since_1970
  my ($MoonPhase, $MoonIllum, $MoonAge, $MoonDist, $MoonAng, $SunDist, $SunAng)  = phase($time);
	#$MoonPhase = ($MoonPhase+0.5)%1;
	my $imgno = int((  (($MoonPhase*@filenames)+.5)%@filenames  )+.5);
	my $img = $filenames[$imgno];

	my $prediction = '';  
  my ($phase, @times) = phaselist(time(), (time()+60*60*24*31));
  while (@times) {
		my $phasetime = shift(@times);	
    $prediction .= "$phase_name[$phase] coming at:\n ".scalar(localtime($phasetime))." (".timediff($phasetime-$time)." remaining)\n";
    $phase = ($phase + 1) % 4;
  }

	my $tooltip =	"Astro::MoonPhase Applet (by harvie 2oo9)\n".
		"Local time is: ".scalar(localtime($time))."\n\n".
		"$prediction\n".
		"MoonPhase = ".($MoonPhase * 100)." %\n".
		"MoonIllum = ".($MoonIllum * 100)." %\n".
		"MoonAge = $MoonAge days\n".
		"MoonDist = $MoonDist km\n".
		"MoonAng = $MoonAng degrees\n".
		"SunDist = $SunDist km\n".
		"SunAng = $SunAng degrees\n".
		"Icon = $img ($imgno/".scalar(@filenames)." images total)\n\n".
		"See man Astro::MoonPhase for explanation\n".
		"Tip: You can make fullmoon gathering with friends each month.\n";
	$img = "$icons/$img";

  print "\033[2J\033[0;0H$tooltip";

	$statusicon->set_tooltip_text($tooltip);
	$statusicon->set_from_file($img);

	alarm(1);
};
alarm(1);

Gtk2->main;


