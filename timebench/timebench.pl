#!/usr/bin/env perl
use strict;
use warnings;

package Time::Bench;

	use Time::HiRes;

	our ($sr, $su, $ss) = (0,0,0); #calibrators

	sub new { #constructor
  	my ($self, $ncalib) = @_;
		$ncalib || $self->bench_calibrate();
  	return $self;
  }

	sub bench {
		shift;
		my $r0 = [Time::HiRes::gettimeofday()];
		my ($u0, $s0, $cu0, $cs0) = times;
		qx{ @_ >/dev/null };
		my ($u, $s, $cu, $cs) = times;
		my $r = Time::HiRes::tv_interval($r0);
		#real, user, system
		return($r-$sr, $cu-$cu0-($u-$u0)-$su, $cs-$cs0-($s-$s0)-$ss);
		#return($r, $cu-$cu0-($u-$u0), $cs-$cs0-($s-$s0));
		#return($r-$sr, $cu-$cu0-$su, $cs-$cs0-$su);
		#return($r, $cu-$cu0, $cs-$cs0);
	}

	sub bench_multiple {
		my ($this, $cmd, $times) = @_;
		my ($ar, $au, $as) = (0,0,0);
		print "\n==> Measuring: $cmd\n";
		for(my $i=1;$i<=$times;$i++) {
			print " => run\t$i\t/$times\r";
			my ($r, $u, $s) = $this->bench($cmd);
			$ar += $r;
			$au += $u;
			$as += $s;		
		}
		print "\n => DONE!\n";
		return ($ar/$times, $au/$times, $as/$times);
	}

	sub bench_print {
		shift;
		my ($r, $u, $s) = @_;
		print "real\t $r\n",
			"user\t $u\n",
			"sys\t $s\n";

	}

	sub bench_calibrate {	
		my ($this) = @_;
		print "==> Calibrating...";
		($sr, $su, $ss) = (0,0,0);
		($sr, $su, $ss) = $this->bench_multiple('true', 1000);
		print " => Correction:\n";
		$this->bench_print($sr, $su, $ss);
		return ($sr, $su, $ss);
	}

	sub bench_sort {
		my ($this, %hash) = @_;
		my $i = 1;
		foreach my $key (sort {$hash{$a} <=> $hash{$b} } keys %hash) {
 			print "$i.)\t$hash{$key}\t\t:\t$key\n";
			$i++;
		}
	}

	sub bench_compare {
		my ($this, $times, @cmds) = @_;
		my (%r, %u, %s);
		foreach(@cmds) {
			($r{$_}, $u{$_}, $s{$_}) = $this->bench_multiple($_, $times);
			$this->bench_print($r{$_}, $u{$_}, $s{$_});
		}
		return (\%r, \%u, \%s);
	}

	sub bench_results {
		my ($this, $r, $u, $s) = @_;
		print "\n==> SORTED RESULTS!\n";
		print " => by Real time:\n";
		$this->bench_sort(%$r);
		print " => by User time:\n";
		$this->bench_sort(%$u);
		print " => by System time:\n";
		$this->bench_sort(%$s);
	}

package main;

	if($#ARGV < 0) {
		print "$0 (CopyLefted by Harvie 2o1o)\n",
			"\t- Compares execution times of given commands\n",
			"\t- (You can compare multiple alghorithms to find the fastest one.)\n",
			"\t- Usage:\t$0 <passes> <cmd1> [<cmd2> <cmd3> ...]\n",
			"\t\t- passes: how many times i should measure (special calibration is done for values < 0)\n",
			"\t\t- cmd1,cmd2,...: commands to compare\n",
			"\n",
			"\t- Example:\t$0 10 'sleep 1' 'sleep 2'\n",
			"\t- Example:\t$0 100 'ls' 'ls -l'\n",
			"\t- Example:\t$0 100 'ping google.com -c 1' 'ping yahoo.com -c 1'\n",
			"\t- Example:\t$0 -1000 true false\n",
			"\n";
		exit;
	}

	my $times = shift @ARGV;
	my $t = Time::Bench->new($times >= 0); #new(1) to disable calibration
	my ($r, $u, $s) =	$t->bench_compare(abs($times), @ARGV);
	$t->bench_results($r, $u, $s);

