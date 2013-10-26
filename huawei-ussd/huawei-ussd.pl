#!/usr/bin/perl

use Getopt::Std;
use Device::Gsm::Pdu;
use Text::Iconv;

# defaults
$opt_r = "/dev/ttyUSB2";
$opt_s = "/dev/ttyUSB0";
$conv = Text::Iconv->new('utf16be','utf8');

my $USAGE = <<__EOU;

Usage: $0 [-r input_port] [-s output_port] [-n] [-h] [-v] [-w] [-i] ussd_msg

Description:
  Send and receive 7-bit PDU-encoded USSD messages.
  Written and tested for Huawei E1550 GSM/UMTS USB modem.

Options:
  -r port   Port to receive data from. Default: $opt_r
  -s port   Port to send AT commands to. Default: $opt_s
  -n        Do not send any data to port. Useful with -v.
  -h        Print this help.
  -v        Be verbose.
  -i        Use iconv [from utf16be to utf8] to reply
  -w        reply workaround (try it if script can not decode reply)
  -z        Do not encode request to 7bit PDU
__EOU

sub HELP_MESSAGE {print "$USAGE\n"; exit;}
sub VERSION_MESSAGE {};
getopts ('r:s:hnvwiz');
HELP_MESSAGE() and exit if (! $ARGV[0]) or defined($opt_h);
my $ussd_req ='';
print "USSD MSG: $ARGV[0]\n" if $opt_v;
if (! $opt_z) {
	$ussd_req = Device::Gsm::Pdu::encode_text7($ARGV[0]);
	$ussd_req =~ s/^..//;
}
else {
	$ussd_req = ($ARGV[0]);
}

print "PDU ENCODED: $ussd_req\n" if $opt_v;

my $ussd_reply;
if (! $opt_n) {
    open (SENDPORT, '+<', $opt_s) or die "Can't open '$opt_s': $!\n";
    print 'Sending AT+CUSD=1,',$ussd_req,",15\r\n" if $opt_v;
    print SENDPORT 'AT+CUSD=1,',$ussd_req,",15\r\n";
    close SENDPORT;
    open (RCVPORT, $opt_r) or die "Can't open '$opt_r': $!\n";
    print "Waiting for USSD reply...\n" if $opt_v;
    while (<RCVPORT>) {
        chomp;
        die "USSD ERROR\n" if $_ eq "+CUSD: 2";
        if (/^\+CUSD: 0,\"([A-F0-9]+)\"/) {
            $ussd_reply = $1;
            print "PDU USSD REPLY: $ussd_reply\n" if $opt_v;
            last;
        }
        print "Got unknown USSD message: $_\n" if /^\+CUSD:/ and $opt_v;
    }
}

if ($ussd_reply) {
    $iconved_reply = $conv->convert(pack('H*', $ussd_reply));
    $decoded_ussd_reply = $opt_w ? pack('H*', $ussd_reply) : Device::Gsm::Pdu::decode_text7('00'.$ussd_reply);
    print STDOUT "USSD REPLY: ".($opt_i ? $iconved_reply: $decoded_ussd_reply)."\n";
}
else
{
    print "No USSD reply!\n";
}
