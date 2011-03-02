#!/usr/bin/perl
# packetstormsecurity.net exploit archive 133ch3r v1.0
# copyleft - fnord0@riseup.net

use strict;
$|++;
eval("use LWP 5.6.9;");  die "[err] LWP 5.6.9 or greater required.\n" if $@;
use Term::ANSIColor qw(:constants);
use Getopt::Std;
use Term::ANSIColor qw(:constants);
use File::Find;
$Getopt::Std::STANDARD_HELP_VERSION = 1;

my $SPLOIT_DIR = undef;
my $YEAR = undef;
my $final_data = undef;
my $total_size = undef;
my $total = undef;
my $search = undef;
my %opt = undef;
getopts ('s:', \%opt);

if ( ! $< == 0 ) {
	die BOLD, RED, "\nThis script requires root privledges!", RESET;
}

if ( ! $ARGV[0] ) {
	$SPLOIT_DIR = "/opt/packetstorm";
	if ( ! -d $SPLOIT_DIR && mkdir $SPLOIT_DIR) {
                print BOLD, BLUE, "[" . BOLD, CYAN, "*" . BOLD, BLUE, "]" . RED, BOLD, " $SPLOIT_DIR" . RESET, BOLD, " directory created, all downloads will be dumped here\n";
}

} else {
      	$SPLOIT_DIR = $ARGV[0];
	if ( ! -d $SPLOIT_DIR && mkdir $SPLOIT_DIR) {
		print BOLD, BLUE, "[" . BOLD, CYAN, "*" . BOLD, BLUE, "]" . RED, BOLD, " $SPLOIT_DIR" . RESET, BOLD, " directory created, all downloads will be dumped here\n";
	} else {
		print BOLD, BLUE, "[" . BOLD, CYAN, "*" . BOLD, BLUE, "]" . RESET, BOLD, " all downloads will be placed in " . RED, BOLD, "$SPLOIT_DIR" . RESET, "\n";
       	}
}

if ($opt{s}) {
	$search = $opt{s};
	system("grep -iR --color --exclude=\"*index\*\" \"$search\" \"$SPLOIT_DIR\"");
	exit;
}

my $CURRENT_YEAR = `date +%Y`;
 $CURRENT_YEAR =~ s/\s+$//;
my @yeararray = (1999..$CURRENT_YEAR);
foreach $YEAR (@yeararray) {
	$final_data = undef;
	$total_size = undef;
	$YEAR =~ m/(\d\d)$/g; $YEAR =~ s/\s+$//;
	my $TWO_DIGIT_YEAR = $1;
	my $stormurl = 'http://dl.packetstormsecurity.net/'."$TWO_DIGIT_YEAR".'12-exploits/'."$YEAR".'-exploits.tgz';
	print BOLD, BLUE, "[" . BOLD, CYAN, "*" . BOLD, BLUE, "]" . BOLD, CYAN, " \'" . BOLD, RED, "$YEAR-exploits.tgz" . BOLD, CYAN, "\'" . RESET, BOLD, " @ packetstormsecurity.net" . BOLD, BLUE, " >> " . RESET, "\n";
	my $ua = LWP::UserAgent->new( );
	my $result = $ua->head($stormurl);
	my $remote_headers = $result->headers;
	$total_size = $remote_headers->content_length;
	if ($total_size <= 500) {
		print BOLD, BLUE, "[" . BOLD, RED, "!" . BOLD, BLUE, "]" . RESET, BOLD, " NO yearly archive available for ->" . BOLD, RED, " $YEAR" . RESET, "\n";
		monthly("$YEAR","$CURRENT_YEAR","$TWO_DIGIT_YEAR");
	} else {
		chdir $SPLOIT_DIR;
		if ( -f "$YEAR-exploits.tgz" ) {
			print BOLD, BLUE, "[" . BOLD, RED, "!" . BOLD, BLUE, "]" . RESET, BOLD, " file already exists for ->" . BOLD, RED, " $YEAR" . RESET, BOLD, " it will not be downloaded" . RESET, "\n";
		} else {
	        	open (EXP,">$YEAR-exploits.tgz") or die "$!";
			my $response = $ua->get($stormurl, ':content_cb' => \&callback );
			`tar xzf "$YEAR"-exploits.tgz`;
			find(\&finder, "$SPLOIT_DIR");
			`chown -R root:users *`;
	}
}
}

sub monthly {
my $YEAR = $_[0];
my $CURRENT_YEAR = $_[1];
my $TWO_DIGIT_YEAR = $_[2];
	my $MONTH;
	my $NUMERIC_MONTH = 0;
	my $LONG_MONTH = 0;
	my @montharray = ("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec");
	foreach $MONTH (@montharray) {
		$final_data = undef;
       		$total_size = undef;
	        $LONG_MONTH = `date -d 1"$MONTH" +%B`; $LONG_MONTH =~ s/\s+$//;
	      	$NUMERIC_MONTH = `date -d 1$MONTH +%m`; $NUMERIC_MONTH =~ s/\s+$//;
	   	my $pstormurl = 'http://dl.packetstormsecurity.net/'."$TWO_DIGIT_YEAR"."$NUMERIC_MONTH".'-exploits/'."$TWO_DIGIT_YEAR"."$NUMERIC_MONTH".'-exploits.tgz';
		print BOLD, BLUE, "[" . BOLD, GREEN, "-" . BOLD, BLUE, "]" . RESET, BOLD, " ..grabbing monthly archives for the year ->" . BOLD, RED, " $YEAR" . RESET, BOLD, ".." . RESET, "\n";
	        print BOLD, BLUE, "[" . BOLD, CYAN, "*" . BOLD, BLUE, "]" . BOLD, CYAN, " \'" . BOLD, RED, "$TWO_DIGIT_YEAR"."$NUMERIC_MONTH".'-exploits.tgz' . BOLD, CYAN, "\'" . RESET, BOLD, " @ packetstormsecurity.net" . BOLD, BLUE, " >> " . RESET, "\n";
	        my $agent = LWP::UserAgent->new( );
	        my $res = $agent->head($pstormurl);
	        my $rmt_headers = $res->headers;
	        $total_size = $rmt_headers->content_length;
	   	if ($total_size <= 500) {
	        	print BOLD, BLUE, "[" . BOLD, RED, "!" . BOLD, BLUE, "]" . RESET, BOLD, " NO monthly archive available for ->" . BOLD, RED, " $LONG_MONTH" . RESET, BOLD, "," . BOLD, RED, " $YEAR" . RESET, "\n";
	       	} else {
	             	chdir $SPLOIT_DIR;
			if ( -f "$TWO_DIGIT_YEAR$NUMERIC_MONTH-exploits.tgz" ) {
                        	print BOLD, BLUE, "[" . BOLD, RED, "!" . BOLD, BLUE, "]" . RESET, BOLD, " file already exists for ->" . BOLD, RED, " $YEAR" . RESET, BOLD, " it will not be downloaded" . RESET, "\n";
                	} else {
	              	open (EXP,">$TWO_DIGIT_YEAR$NUMERIC_MONTH-exploits.tgz") or die "$!";
	              	my $response = $agent->get($pstormurl, ':content_cb' => \&callback );
			`tar xzf "$TWO_DIGIT_YEAR$NUMERIC_MONTH"-exploits.tgz`;
			`chown -R root:users *`;
			find(\&finder, "$SPLOIT_DIR");
			}
		}
	}
}

sub callback {
    my ($data, $response, $protocol) = @_;
    print EXP "$data";
    $final_data .= $data;
    print progress_bar( length($final_data), $total_size, 25, '=' );
}

sub progress_bar {
	my ( $got, $total, $width, $char ) = @_;
	$width ||= 25; $char ||= '=';
	my $num_width = length $total;
	sprintf "|%-${width}s| leeched %${num_width}s bytes of %s (%.2f%%)\r",
		$char x (($width-1)*$got/$total). '>',
		$got, $total, 100*$got/+$total;
}

sub finder {
	-f && chmod 0644, $_;
	-d && chmod 0755, $_;
}

sub VERSION_MESSAGE { my $fh = shift;
	print $fh ".::[" . RESET, BOLD, " packetstormsecurity.net exploit archive 133ch3r v1.0 " . RESET, "]::.\n";
}

sub HELP_MESSAGE { my $fh = shift; 
	print $fh BOLD, RED, "\n  USAGE: ", RESET;
	print $fh BOLD, BLUE, "./packetstorm.pl " . BOLD, BLUE, "[" . BOLD, CYAN, "<directory>" . BOLD, BLUE, "|" . BOLD, CYAN, "-s <search>" . BOLD, BLUE, "]\n\n", RESET;
	print $fh "\tCOMMAND LINE ARGUMENTS" . BOLD, RED, "\t\t*ROOT level access REQUIRED*\n". RESET;
	print $fh RESET, BOLD, "\tDEFAULT" . RESET, "\t\t" . RESET, "=> download all packetstormsecurity.net exploit archives to " . RESET, BOLD, "\'/opt/packetstorm\'\n";
	print $fh BOLD, BLUE, "\t<" . RESET, BOLD, "folder" . BOLD, BLUE, ">" . RESET, "\t" . RESET, "=> place all packetstormsecurity.net exploit archives in specified folder\n";
	print $fh BOLD, BLUE, "\t-s <" . RESET, BOLD, "search" . BOLD, BLUE, ">\t" . RESET, "=> search " . RESET, BOLD, "local" . RESET, " exploit archives for specific search string (" . RESET, BOLD, "/opt/packetstorm" . RESET, ")\n";
	print $fh BOLD, BLUE, "\t--help\t\t" . RESET, "=> displays help\n";
	print $fh BOLD, BLUE, "\t--version\t" . RESET, "=> displays version information\n";
	print $fh "\n";
	print $fh "\t\tEXAMPLEs:  " . BOLD, BLUE, "packetstorm.pl\n", RESET;
	print $fh "\t\t           " . BOLD, BLUE, "packetstorm.pl /tmp\n", RESET;
	print $fh "\t\t           " . BOLD, BLUE, "packetstorm.pl -s ettercap\n", RESET;
	print $fh "\t\t           " . BOLD, BLUE, "packetstorm.pl -s \"phpmyadmin 2.\"\n", RESET;
	print $fh "\n";
}
