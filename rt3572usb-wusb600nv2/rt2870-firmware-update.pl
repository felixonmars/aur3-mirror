#!/usr/bin/perl
# rt2870-firmware-update v0.2.2.1
## Copyright 2011-12 Simone Sclavi 'Ito'
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
use warnings;
use strict;
use feature 'say';
use LWP;
use URI;
use File::Copy;
use Archive::Extract;
use File::Compare;
use Getopt::Long qw(:config no_ignore_case);
use Term::ANSIColor qw(:constants);
$Term::ANSIColor::AUTORESET = 1;

my $probe;
my $res = GetOptions("probe|p" => \$probe);
die ":: usage: $0 [ --probe | -p ]\n" unless $res and (scalar @ARGV == 0);

if ($probe)
{
    my $LSUSB = qx(which lsusb 2> /dev/null);
    chomp $LSUSB;
    die ":: install 'usbutils' package first!\n" unless $LSUSB;
    my $lsusb_out = qx($LSUSB -d 1737:0079);
    if ($lsusb_out)
    {
        say BLUE ":: device 'ID 1737:0079 Linksys WUSB600N v2' found!";
        exit 0;
    }
    else{
        say RED qq{:: WARNING: I cannot find the Linksys WUSB600N v2 device!
:: If your wireless adapter is connected, probably the
:: 'rt3572sta' driver is NOT what you need...};
exit 1;
}
}
die ":: root privileges required!\n" unless ($> == 0 or $< == 0) ;

my $ralink_url = URI->new('http://mirror.thebasementserver.com');
$ralink_url->path('/soft/ralink/linux/');

my $browser = LWP::UserAgent->new();
$browser->env_proxy( ); # in case  we're behind a firewall
$browser->timeout(30);
my $resp = $browser->get($ralink_url);
die ':: oops, got error #', $resp->status_line, "#, exiting ...\n" unless $resp->is_success;
## looking for latest firmware
if ($resp->content !~ /(?<fw_name>RT2870_Firmware_V\d+\.zip)/)
{
    die ":: cannot find a suitable firmware to download\n";
}

#add firmware name to url path
my @segments = $ralink_url->path_segments();
push @segments, $+{fw_name};
$ralink_url->path_segments(@segments);

$resp = $browser->get($ralink_url, ':content_file' => '/tmp/rt2870-firmware.zip'); 
die ':: oops, got error #', $resp->status_line, "#, exiting ...\n" unless $resp->is_success;

my $ae = Archive::Extract->new( archive => '/tmp/rt2870-firmware.zip' );
$ae->extract( to => '/tmp') or die ':: ', $ae->error, "\n";

my $new_firmware = $ae->extract_path . '/rt2870.bin';
my $old_firmware = '/usr/lib/firmware/rt2870.bin';
die ":: you already have the latest firmware\n" if (compare($new_firmware, $old_firmware) == 0); 
copy ($new_firmware, $old_firmware) or die ":: copy failed: $!\n";
say ':: firmware updated successfully!';

