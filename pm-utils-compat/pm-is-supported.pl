#!/usr/bin/perl
use feature qw(switch);
use strict;
use warnings;
no if $] >= 5.017011, warnings => qw(experimental::smartmatch);

my %conf;
my @can_state;
my @can_disk;
my $want_state;
my $want_disk;
my @want_state;
my @want_disk;
my $can_state;
my $can_disk;

if (open(my $f, "< /sys/power/state")) {
        @can_state = grep {chomp || 1}
                     split(/\s+/, <$f>);
        close($f);
} elsif (!$!{ENOENT}) {
        die "Error: Unable to open /sys/power/state: $!\n";
}

if (open(my $f, "< /sys/power/disk")) {
        @can_disk = grep {s/^\[//; s/\]$//; 1}
                    grep {chomp || 1}
                    split(/\s+/, <$f>);
        close($f);
} elsif (!$!{ENOENT}) {
        die "Error: Unable to open /sys/power/disk: $!\n";
}

if (open(my $f, "< /etc/systemd/sleep.conf")) {
        %conf = map {split(/=/, $_, 2)}
                grep {/^\w+=/}
                grep {chomp || 1}
                <$f>;
        close($f);
} elsif (!$!{ENOENT}) {
        die "Error: Unable to open /etc/systemd/sleep.conf: $!\n";
}

for (shift @ARGV) {
        when (undef) {
                warn "Usage: pm-is-supported --{suspend|hibernate|suspend-hybrid}\n";
                exit 2;
        }

        s/^--//;
        s/_/-/g;

        when ("suspend") {
                $want_state = $conf{SuspendState} // "mem,standby,freeze";
                $want_disk = $conf{SuspendMode} // "";
        }
        when ("hibernate") {
                $want_state = $conf{HibernateState} // "disk";
                $want_disk = $conf{HibernateMode} // "platform,shutdown";
        }
        when ("suspend-hybrid") {
                $want_state = $conf{HybridSleepState} // "disk";
                $want_disk = $conf{HybridSleepMode} // "suspend,platform,shutdown";
        }
        default {
                exit 1;
        }
}

@want_state = split(/,/, $want_state);
@want_disk = split(/,/, $want_disk);

$can_state = scalar grep {$_ ~~ @can_state} @want_state;
$can_disk = @want_disk
            ? scalar grep {$_ ~~ @can_disk} @want_disk
            : 1;

exit !($can_state && $can_disk);
