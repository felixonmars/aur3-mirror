#!/usr/bin/perl
# Original script copyright 2005 tud.thaunderdog
#
#Changes 17 sep 2006 by Dutch:
#Disable external DTD validation for the parser, so that the instanced LibXML
#parsers don't go out on the net in order to validate each and every gps-point 
#network line the parsers read and write. By disabling this check, the script 
#runs faster as well as can be run without an active internet connection.
#Default for newer versions of LibXML is to validate against any external DTD's 
#referenced in DOCTYPE statements.
#
#Changes 16 feb 2006 by Dutch:
#Skipped the foreach loop for comparing new networks to previous networks, and
#changed it to use a hash and lookup from the hash for the existing networks
#Speeded the script up by a factor of 10+. Previously 3000 existing networks
#merged/updated with 1200 networks took over 24 hours on an 850 Mhz P3 machine.
#With the hashing it takes about 1 hour.
#
#Changes 10 feb 2006 by Dutch: 
#Minor bugfix and change to last iso next in foreach loops, to speed up a bit
#also added checks for first log read in, then no need to compare with array
#and no need to update the outputfile untill all data from first file read in.
#
#

use XML::LibXML;

unless ( @ARGV > 2 ) {
    print "Usage: $0 <input-1st> <input-Nth> <output>\n";
    exit;
}

$start_time = localtime(time);

$out_file_name = pop @ARGV;
@log_files = @ARGV;
$net_num = 0;
$firstlog = 0;
%seen = ();
$outcounter = 1;
foreach $this_log (@log_files) {
	$firstlog++;
	print "KLC: Reading Logfile $this_log....\n";
	

	$doc = XML::LibXML::Document->new();
	$root = $doc->createElement('html');
	$doc->setDocumentElement($root);
	$body = $doc->createElement('body');
	$root->appendChild($body);
	
	
	
	if (!$xml_body) {
		open(LOG_FILE,"<$this_log");
		@log_file = <LOG_FILE>;
		close(LOG_FILE);
		
		foreach my $line (@log_file) {
			if ($line=~/<?xml/) { $xml_head .= $line; }
			elsif ($line=~/<!DOCTYPE/) {$xml_head .= $line; }
			elsif ($line=~/<detection-run/) { $xml_head .= $line; }
			elsif ($line=~/<\/detection-run/) { $xml_foot .= $line; }
		}
		
		open(OUT_FILE,">$out_file_name");
		print OUT_FILE ("$xml_head"); 
		print OUT_FILE ("$xml_foot");
		close(OUT_FILE);
		$xml_body = 1;
	}
	
		
	$parser = XML::LibXML->new();
	$parser->expand_entities(0);
	$parser->load_ext_dtd(0);
	$tree = $parser->parse_file($this_log);
	$root = $tree->getDocumentElement;
	
	@networks = $root->getElementsByTagName('wireless-network');
	foreach $this_network (@networks) {
	
		$net_bssid = $this_network->getElementsByTagName('BSSID')->[0]->getFirstChild->getData;
		if ("$firstlog" eq "1")	{
		    $seen{$net_bssid} = $outcounter; 
		    $outcounter++;
		}; #if reading the first log, fill the hash with each BSSID
		$out_parser = XML::LibXML->new();
		$out_parser->expand_entities(0);
		$out_parser->load_ext_dtd(0);
		$out_tree = $out_parser->parse_file($out_file_name);
		$out_root = $out_tree->getDocumentElement;
		
		if ( $temp = $out_root->getElementsByTagName('wireless-network') ) { @out_networks = $out_root->getElementsByTagName('wireless-network'); }
		
		$unique = 1;
		
		if ("$firstlog" > "1") {
		if (@out_networks) {
				if ( $seen{$net_bssid} ) {
				#if the new read BSSID is seen previously then clear unique flag, output the network data for later
				#processing. We use the hash value as the index into the array, to get the data. As the array 
				#is 0 based and the counter we store in the hash is 1 based, we subtract 1.
				#the counter can't be zerobased as zero is the false flagvalue in perl, so the first entry in the hash
				#would be evaluated as false, in the above if test.
					undef $unique;
					$out_net = $out_networks[($seen{$net_bssid}-1)];
				} else {
					$seen{$net_bssid} = $outcounter;
					$outcounter++;
				#if not seen we add it to the hash and increment the counter
				} 
		 } # end if there are networks in out file
		} # end if firstlog different from the initial read log
		if ($unique) {
			print "KLC: Merging $net_bssid  -  $net_num - $firstlog\n";
			 $net_num++;
			 $this_network_xml = $this_network->toString;
			 $this_network_xml=~ s/<wireless-network number="\d+"/  <wireless-network number="$net_num"/;
			 $networks .= "\n$this_network_xml";
		} else {
			print "KLC: Merging $net_bssid  -  Updated\n";
			undef $networks;
			undef $gps;
			$net_packets_LLC = $this_network->getElementsByTagName('LLC')->[0]->getFirstChild->getData;
			$out_net_packets_LLC = $out_net->getElementsByTagName('LLC')->[0]->getFirstChild->getData;
			$net_packets_LLC += $out_net_packets_LLC;
			
			$net_packets_data = $this_network->getElementsByTagName('data')->[0]->getFirstChild->getData;
			$out_net_packets_data = $out_net->getElementsByTagName('data')->[0]->getFirstChild->getData;
			$net_packets_data += $out_net_packets_data;
			
			$net_packets_crypt = $this_network->getElementsByTagName('crypt')->[0]->getFirstChild->getData;
			$out_net_packets_crypt = $out_net->getElementsByTagName('crypt')->[0]->getFirstChild->getData;
			$net_packets_crypt += $out_net_packets_crypt;
			
			$net_packets_weak = $this_network->getElementsByTagName('weak')->[0]->getFirstChild->getData;
			$out_net_packets_weak = $out_net->getElementsByTagName('weak')->[0]->getFirstChild->getData;
			$net_packets_weak += $out_net_packets_weak;
			
			$net_packets_dupeiv = $this_network->getElementsByTagName('dupeiv')->[0]->getFirstChild->getData;
			$out_net_packets_dupeiv = $out_net->getElementsByTagName('dupeiv')->[0]->getFirstChild->getData;
			$net_packets_dupeiv += $out_net_packets_dupeiv;
			
			$net_packets_total = $this_network->getElementsByTagName('total')->[0]->getFirstChild->getData;
			$out_net_packets_total = $out_net->getElementsByTagName('total')->[0]->getFirstChild->getData;
			$net_packets_total += $out_net_packets_total;
			
			$net_packets_datasize = $this_network->getElementsByTagName('datasize')->[0]->getFirstChild->getData;
			$out_net_packets_datasize = $out_net->getElementsByTagName('datasize')->[0]->getFirstChild->getData;
			$net_packets_datasize += $out_net_packets_datasize;
			
			if ( ( $temp = $this_network->getElementsByTagName('min-lat')->[0] ) && ( $temp = $out_net->getElementsByTagName('min-lat')->[0] ) ) {
				$gps = 1;
				
				$net_gps_min_lat = $this_network->getElementsByTagName('min-lat')->[0]->getFirstChild->getData;
				$out_net_gps_min_lat = $out_net->getElementsByTagName('min-lat')->[0]->getFirstChild->getData;
				if ( $net_gps_min_lat > $out_net_gps_min_lat ) { $net_gps_min_lat = $out_net_gps_min_lat; }
				
				$net_gps_min_lon = $this_network->getElementsByTagName('min-lon')->[0]->getFirstChild->getData;
				$out_net_gps_min_lon = $out_net->getElementsByTagName('min-lon')->[0]->getFirstChild->getData;
				if ( $net_gps_min_lon > $out_net_gps_min_lon ) { $net_gps_min_lon = $out_net_gps_min_lon; }
				
				$net_gps_min_alt = $this_network->getElementsByTagName('min-alt')->[0]->getFirstChild->getData;
				$out_net_gps_min_alt = $out_net->getElementsByTagName('min-alt')->[0]->getFirstChild->getData;
				if ( $net_gps_min_alt > $out_net_gps_min_alt ) { $net_gps_min_alt = $out_net_gps_min_alt; }
				
				$net_gps_min_spd = $this_network->getElementsByTagName('min-spd')->[0]->getFirstChild->getData;
				$out_net_gps_min_spd = $out_net->getElementsByTagName('min-spd')->[0]->getFirstChild->getData;
				if ( $net_gps_min_spd > $out_net_gps_min_spd ) { $net_gps_min_spd = $out_net_gps_min_spd; }
				
				$net_gps_max_lat = $this_network->getElementsByTagName('max-lat')->[0]->getFirstChild->getData;
				$out_net_gps_max_lat = $out_net->getElementsByTagName('max-lat')->[0]->getFirstChild->getData;
				if ( $net_gps_max_lat < $out_net_gps_max_lat ) { $net_gps_max_lat = $out_net_gps_max_lat; }
				
				$net_gps_max_lon = $this_network->getElementsByTagName('max-lon')->[0]->getFirstChild->getData;
				$out_net_gps_max_lon = $out_net->getElementsByTagName('max-lon')->[0]->getFirstChild->getData;
				if ( $net_gps_max_lon < $out_net_gps_max_lon ) { $net_gps_max_lon = $out_net_gps_max_lon; }
				
				$net_gps_max_alt = $this_network->getElementsByTagName('max-alt')->[0]->getFirstChild->getData;
				$out_net_gps_max_alt = $out_net->getElementsByTagName('max-alt')->[0]->getFirstChild->getData;
				if ( $net_gps_max_alt < $out_net_gps_max_alt ) { $net_gps_max_alt = $out_net_gps_max_alt; }
				
				$net_gps_max_spd = $this_network->getElementsByTagName('max-spd')->[0]->getFirstChild->getData;
				$out_net_gps_max_spd = $out_net->getElementsByTagName('max-spd')->[0]->getFirstChild->getData;
				if ( $net_gps_max_spd < $out_net_gps_max_spd ) { $net_gps_max_spd = $out_net_gps_max_spd; }
				
			}
			
			foreach  $this_out_network (@out_networks) {
				$this_network_xml = $this_out_network->toString;
				if ($this_out_network eq $out_net) {
					$this_network_xml=~ s/<LLC>\d*<\/LLC>/<LLC>$net_packets_LLC<\/LLC>/;
					$this_network_xml=~ s/<data>\d*<\/data>/<data>$net_packets_data<\/data>/;
					$this_network_xml=~ s/<crypt>\d*<\/crypt>/<crypt>$net_packets_crypt<\/crypt>/;
					$this_network_xml=~ s/<weak>\d*<\/weak>/<weak>$net_packets_weak<\/weak>/;
					$this_network_xml=~ s/<dupeiv>\d*<\/dupeiv>/<dupeiv>$net_packets_dupeiv<\/dupeiv>/;
					$this_network_xml=~ s/<total>\d*<\/total>/<total>$net_packets_total<\/total>/;
					$this_network_xml=~ s/<datasize>\d*<\/datasize>/<datasize>$net_packets_datasize<\/datasize>/;
					
					if ($gps) {
						$this_network_xml=~ s/<min-lat>\d*\.\d*<\/min-lat>/<min-lat>$net_gps_min_lat<\/min-lat>/;
						$this_network_xml=~ s/<min-lon>\d*\.\d*<\/min-lon>/<min-lon>$net_gps_min_lon<\/min-lon>/;
						$this_network_xml=~ s/<min-alt>\d*\.\d*<\/min-alt>/<min-alt>$net_gps_min_alt<\/min-alt>/;
						$this_network_xml=~ s/<min-spd>\d*\.\d*<\/min-spd>/<min-spd>$net_gps_min_spd<\/min-spd>/;
						$this_network_xml=~ s/<max-lat>\d*\.\d*<\/max-lat>/<max-lat>$net_gps_max_lat<\/max-lat>/;
						$this_network_xml=~ s/<max-lon>\d*\.\d*<\/max-lon>/<max-lon>$net_gps_max_lon<\/max-lon>/;
						$this_network_xml=~ s/<max-alt>\d*\.\d*<\/max-alt>/<max-alt>$net_gps_max_alt<\/max-alt>/;
						$this_network_xml=~ s/<max-spd>\d*\.\d*<\/max-spd>/<max-spd>$net_gps_max_spd<\/max-spd>/;
					}
					
					
					$client_num = @net_clients = $this_network->getElementsByTagName('wireless-client');
					undef $client_num;
					if (@net_clients) {
					
						while ($this_network_xml=~ /.*client.*\n/) { $this_network_xml=~ s/.*client.*\n//; }
						$this_network_xml=~ s/.*<\/wireless-network>.*//;
						
						
						foreach  $this_client (@net_clients) {
							$unique = 1;
							$client_mac = $this_client->getElementsByTagName('client-mac')->[0]->getFirstChild->getData;
							$out_net_clients_total = @out_net_clients = $out_net->getElementsByTagName('wireless-client');
							
							foreach  $out_this_client (@out_net_clients) {
								 $out_client_mac = $out_this_client->getElementsByTagName('client-mac')->[0]->getFirstChild->getData;
								
								if ( "$client_mac" eq "$out_client_mac" ) {
									undef $unique;
									$out_client = $this_out_client;
									last;
								}

							}
							
							if ($unique) {
								print "     Client  $client_mac\n";
								$this_client_xml = $this_client->toString;
								$client_num++;
								$this_client_xml=~ s/<wireless-client number="\d+"/<wireless-client number="$client_num"/;
								
							} else {
								print "     Client  $client_mac  -  Updated\n";
								undef $gps;
								$client_packets_data = $this_client->getElementsByTagName('client-data')->[0]->getFirstChild->getData;
								$out_client_net_packets_data = $out_net->getElementsByTagName('client-data')->[0]->getFirstChild->getData;
								$client_packets_data += $out_client_net_packets_data;
			
								$client_packets_crypt = $this_client->getElementsByTagName('client-crypt')->[0]->getFirstChild->getData;
								$out_client_net_packets_crypt = $out_net->getElementsByTagName('client-crypt')->[0]->getFirstChild->getData;
								$client_packets_crypt += $out_client_net_packets_crypt;
			
								$client_packets_weak = $this_client->getElementsByTagName('client-weak')->[0]->getFirstChild->getData;
								$out_client_net_packets_weak = $out_net->getElementsByTagName('client-weak')->[0]->getFirstChild->getData;
								$client_packets_weak += $out_client_net_packets_weak;
								
								$client_packets_datasize = $this_client->getElementsByTagName('client-datasize')->[0]->getFirstChild->getData;
								$out_client_packets_datasize = $out_net->getElementsByTagName('client-datasize')->[0]->getFirstChild->getData;
								$client_packets_datasize += $out_client_packets_datasize;
								
								if ( ( $temp = $this_client->getElementsByTagName('client-min-lat')->[0] ) && ( $temp = $out_net->getElementsByTagName('client-min-lat')->[0] ) ) {
									$gps = 1;
				
									$client_gps_min_lat = $this_client->getElementsByTagName('client-min-lat')->[0]->getFirstChild->getData;
									$out_net_gps_min_lat = $out_net->getElementsByTagName('client-min-lat')->[0]->getFirstChild->getData;
									if ( $client_gps_min_lat > $out_net_gps_min_lat ) { $client_gps_min_lat = $out_net_gps_min_lat; }
							
									$client_gps_min_lon = $this_client->getElementsByTagName('client-min-lon')->[0]->getFirstChild->getData;
									$out_net_gps_min_lon = $out_net->getElementsByTagName('client-min-lon')->[0]->getFirstChild->getData;
									if ( $client_gps_min_lon > $out_net_gps_min_lon ) { $client_gps_min_lon = $out_net_gps_min_lon; }
				
									$client_gps_min_alt = $this_client->getElementsByTagName('client-min-alt')->[0]->getFirstChild->getData;
									$out_net_gps_min_alt = $out_net->getElementsByTagName('client-min-alt')->[0]->getFirstChild->getData;
									if ( $client_gps_min_alt > $out_net_gps_min_alt ) { $client_gps_min_alt = $out_net_gps_min_alt; }
				
									$client_gps_min_spd = $this_client->getElementsByTagName('client-min-spd')->[0]->getFirstChild->getData;
									$out_net_gps_min_spd = $out_net->getElementsByTagName('client-min-spd')->[0]->getFirstChild->getData;
									if ( $client_gps_min_spd > $out_net_gps_min_spd ) { $client_gps_min_spd = $out_net_gps_min_spd; }
				
									$client_gps_max_lat = $this_client->getElementsByTagName('client-max-lat')->[0]->getFirstChild->getData;
									$out_net_gps_max_lat = $out_net->getElementsByTagName('client-max-lat')->[0]->getFirstChild->getData;
									if ( $client_gps_max_lat < $out_net_gps_max_lat ) { $client_gps_max_lat = $out_net_gps_max_lat; }
				
									$client_gps_max_lon = $this_client->getElementsByTagName('client-max-lon')->[0]->getFirstChild->getData;
									$out_net_gps_max_lon = $out_net->getElementsByTagName('client-max-lon')->[0]->getFirstChild->getData;
									if ( $client_gps_max_lon < $out_net_gps_max_lon ) { $client_gps_max_lon = $out_net_gps_max_lon; }
				
									$client_gps_max_alt = $this_client->getElementsByTagName('client-max-alt')->[0]->getFirstChild->getData;
									$out_net_gps_max_alt = $out_net->getElementsByTagName('client-max-alt')->[0]->getFirstChild->getData;
									if ( $client_gps_max_alt < $out_net_gps_max_alt ) { $client_gps_max_alt = $out_net_gps_max_alt; }
				
									$client_gps_max_spd = $this_client->getElementsByTagName('client-max-spd')->[0]->getFirstChild->getData;
									$out_net_gps_max_spd = $out_net->getElementsByTagName('client-max-spd')->[0]->getFirstChild->getData;
									if ( $client_gps_max_spd < $out_net_gps_max_spd ) { $client_gps_max_spd = $out_net_gps_max_spd; }
								} # endif client if gps
								
								$this_client_xml = $this_client->toString;
								$this_client_xml=~ s/<client-data>\d*<\/client-data>/<client-data>$client_packets_data<\/client-data>/;
								$this_client_xml=~ s/<client-crypt>\d*<\/client-crypt>/<client-crypt>$client_packets_crypt<\/client-crypt>/;
								$this_client_xml=~ s/<client-weak>\d*<\/client-weak>/<client-weak>$client_packets_weak<\/client-weak>/;
								$this_client_xml=~ s/<client-datasize>\d*<\/client-datasize>/<client-datasize>$client_packets_datasize<\/client-datasize>/;
								if ($gps) {
									$this_client_xml=~ s/<client-min-lat>\d*\.\d*<\/client-min-lat>/<client-min-lat>$client_gps_min_lat<\/client-min-lat>/;
									$this_client_xml=~ s/<client-min-lon>\d*\.\d*<\/client-min-lon>/<client-min-lon>$client_gps_min_lon<\/client-min-lon>/;
									$this_client_xml=~ s/<client-min-alt>\d*\.\d*<\/client-min-alt>/<client-min-alt>$client_gps_min_alt<\/client-min-alt>/;
									$this_client_xml=~ s/<client-min-spd>\d*\.\d*<\/client-min-spd>/<client-min-spd>$client_gps_min_spd<\/client-min-spd>/;
									$this_client_xml=~ s/<client-max-lat>\d*\.\d*<\/client-max-lat>/<client-max-lat>$client_gps_max_lat<\/client-max-lat>/;
									$this_client_xml=~ s/<client-max-lon>\d*\.\d*<\/client-max-lon>/<client-max-lon>$client_gps_max_lon<\/client-max-lon>/;
									$this_client_xml=~ s/<client-max-alt>\d*\.\d*<\/client-max-alt>/<client-max-alt>$client_gps_max_alt<\/client-max-alt>/;
									$this_client_xml=~ s/<client-max-spd>\d*\.\d*<\/client-max-spd>/<client-max-spd>$client_gps_max_spd<\/client-max-spd>/;
								} # end gps
								$client_num++;
								$this_client_xml=~ s/<wireless-client number="\d+"/<wireless-client number="$client_num"/;
																
								
								
							} # end if client unique
							
							$this_network_xml .= "$this_client_xml\n";
							
						} # end foreach client this net
						$this_network_xml.= "</wireless-network>\n";
					} # end if net has clients
					
					$networks .= "\n$this_network_xml";
					
				} else {
					$networks .= "\n$this_network_xml";
				} # end if found unique net

			} # end foreach out network
			
		} # end if net unique
	    if ("$firstlog" > "1") {
		open(OUT_FILE,">$out_file_name");
		print OUT_FILE ("$xml_head");
		print OUT_FILE ("$networks\n");
		print OUT_FILE ("$xml_foot\n");
		close(OUT_FILE);
	    }
	} # end foreach $this_network
	    if ("$firstlog" eq "1") {
		open(OUT_FILE,">$out_file_name");
		print OUT_FILE ("$xml_head");
		print OUT_FILE ("$networks\n");
		print OUT_FILE ("$xml_foot\n");
		close(OUT_FILE);
	    }


		print "saving data sofar\n";
			

} # end foreach $this_log

$end_time = localtime(time);

print "KLC: Combined Logs to $out_file_name\n";
print "KLC: Operation Started: $start_time\n";
print "KLC: Operation Ended:   $end_time\n";
print "KLC: Done\n";
# EOF
