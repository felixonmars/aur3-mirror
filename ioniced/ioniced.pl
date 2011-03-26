#!/usr/bin/perl -w

# version 1.1, 05.12.2005, Hauke Laging, http://www.hauke-laging.de/software/
# slightly edited by Jan Mette, spam-o-mat at nickname.berlin.de
# This software is licensed under the Gnu GPL, see http://www.fsf.org/

# This script has the task to prevent I/O intensive system processes from 
# annoying the user by slowing the system down. These typical administrative 
# processes are not required to complete within a short time so it makes sense 
# to reduce the I/O priority of these tasks (which usually impacts the performance 
# of user processes much more than the CPU proirity).
#
# This script does not affect processes which have been niced to a value below zero 
# (higher priority) or already ioniced (to any value).
# This is the most simple way to prevent a process from being affected by this script.
# You can configure if a white list or black list approach is used: Either only the 
# configured programs are affected or only those not.
#
# The script runs as a daemon and reads the current PID list from ps every few 
# seconds. It cannot (or at least does not) prevent tasks from starting with 
# high I/O priority (high := high enough to annoy) but this problem es solved 
# after a few seconds.
#
# Thus this script should be started in the background. It writes to STDOUT what 
# it does/doesn't do.
#
# This script requires kernel 2.6.13 or above and the availability of ionice.

# definitions
# signals:
# USR1: The current list of known processes and their I/O priotity change status 
#	is dumped into the file $dump_file. Values 1,2 and 3 represent set priorities 
#	whereas 0 represents an unchanged priority.

@args = ("/bin/bash","-c","type ionice");
system(@args);
if ($? != 0)
{
	print "The program 'ionice' is not available; aborting.\n";
	exit 1;
}

use integer;

#
# configuration
#
$min_user_id = 100;
$max_user_id = 200;
$syslog_tag="ioniced.pl";
$0=$syslog_tag;
# poll interval
$sleep = 3;
$leave_inid_pids_untouched=0;
$whitelist=1;
$dump_file="/tmp/ioniced.dump";
%known_pids = (); # Werte: 1,2,3 fuer die gesetzten, 0 fuer die unveraenderten

#
# processes that should be skipped
#
%skip_these = ("init"=>0,"ps"=>0,"sshd"=>0,"syslog-ng"=>0,"httpd2-prefork"=>0,"pdflush"=>0); # values: dummys

#
# processes that should be ioniced
#
%ionice_these = (find=>3,tar=>3,updatedb=>3,mandb=>3,cp=>3,mv=>3,rpm=>3,gzip=>3,kio_file=>3); # values: new I/O priority level



############ DO NOT EDIT BELOW THIS LINE ############

sub dump_ioprios {
	if (not open(FH,"> $dump_file"))
	{
		return;
	}
	foreach (keys %known_pids)
	{
		print FH $_," ",$known_pids{$_},"\n";
	}
	close(FH);
}

$SIG{USR1}="dump_ioprios";

# BEGIN: initialize the hash with the present pids
@pslines = qx/ps -eo pid,ruid,nice,comm/;
$i=0;
foreach (@pslines)
{
	$i++;
	next if $i == 1; # header line pf ps output
	$_ =~ s/^\s+//;
	$_ =~ s/\s+$//;
	@elements = split(" +",$_);
	$pid=$elements[0];
	$ruid=$elements[1];
	$nice=$elements[2];
	$command=$elements[3];
	$change_it=1;
	$change_it=0 if ($leave_inid_pids_untouched);
	$change_it=0 if ($ruid>=$min_user_id && $ruid<=$max_user_id);
	$change_it=0 if ($nice<0);
	$change_it=0 if (exists($skip_these{$command}));
	if ($change_it) # execute this one conditionally only because it takes time
	{
		$ionice_status=qx/ionice -p $pid/;
		$ionice_status =~ s/:.*$//;
		$change_it=0 if ($ionice_status != "none");
	}
	if ($whitelist)
	{
		$change_it=0 unless (exists($ionice_these{$command}));
	}
	if ($change_it)
	{
		$io_class=3;
		$explicit_io_class=$ionice_these{$command};
		if ($whitelist && defined($explicit_io_class) && ($explicit_io_class eq 1 || $explicit_io_class eq 2 || $explicit_io_class eq 3))
		{
			$io_class=$explicit_io_class;
		}
		$known_pids{$pid}=$io_class;
		system("ionice -c${io_class} -p${pid}");
		print "PID ${pid} ($command) has been changed to I/O class ${io_class}.\n";
		if ($whitelist)
		{
			system("logger -t \"${syslog_tag}\" \"PID ${pid} ($command) has been changed to I/O class ${io_class}.\"");
		}
	}
	else
	{
		$known_pids{$pid}=0;
		print "PID ${pid}'s ($command) I/O class has not been changed.\n"
	}
}
print "Initialization finished.\n";
# END: initialize the hash with the present pids

while (1)
{
	sleep $sleep;
	print "\n\nChecking for new PIDs:\n";
	@pslines = qx/ps -eo pid,ruid,nice,comm/;
	$i=0;
	%current_pids=(); # Werte: Dummys
	foreach (@pslines)
	{
		$i++;
		next if $i == 1; # header line pf ps output
		$_ =~ s/^\s+//;
		$_ =~ s/\s+$//;
		@elements = split(" +",$_);
		$pid=$elements[0];
		$ruid=$elements[1];
		$nice=$elements[2];
		$command=$elements[3];
		$current_pids{$pid}=0;
		next if (exists($known_pids{$pid}));
		next if ($command eq "ps");
		$change_it=1;
		$change_it=0 if ($ruid>=$min_user_id && $ruid<=$max_user_id);
		$change_it=0 if ($nice<0);
		$change_it=0 if (exists($skip_these{$command}));
		if ($change_it) # execute this one conditionally only because it takes time
		{
			$ionice_status=qx/ionice -p $pid/;
			$ionice_status =~ s/:.*$//;
			chomp($ionice_status);
			$change_it=0 if ($ionice_status ne "none");
		}
		if ($whitelist)
		{
			$change_it=0 unless (exists($ionice_these{$command}));
		}
		if ($change_it)
		{
			$io_class=3;
			$explicit_io_class=$ionice_these{$command};
			if ($whitelist && defined($explicit_io_class) && ($explicit_io_class eq 1 || $explicit_io_class eq 2 || $explicit_io_class eq 3))
			{
				$io_class=$explicit_io_class;
			}
			$known_pids{$pid}=$io_class;
			system("ionice -c${io_class} -p${pid}");
			print "PID ${pid} ($command) has been changed to I/O class ${io_class}.\n";
			if ($whitelist)
			{
				system("logger -t \"${syslog_tag}\" \"PID ${pid} ($command) has been changed to I/O class ${io_class}.\"");
			}
		}
		else
		{
			$known_pids{$pid}=0;
			print "PID ${pid}'s ($command) I/O class has not been changed.\n"
		}
	}
	print "\n\nPID check\n";
	foreach (keys %known_pids)
	{
		unless (exists($current_pids{$_}))
		{
			delete($known_pids{$_});
			print "PID ",$_," does not exist any more and has been deleted from the hash.\n";
		}
	}
}
