--- yfktest.pl	2008-06-16 17:33:51.000000000 -0600
+++ yfktest.pl	2008-07-02 18:54:17.000000000 -0600
@@ -86,7 +86,6 @@
 
 our ($contest,			# definition file: defs/$contest.def
 	$filename,			# of this current contest log
-	$mycall,
 	$assisted,			# for cabrillo log
 	$bands,				
 	$modes,	
@@ -94,6 +93,7 @@
 	$power,
 	$transmitter);
 
+our $mycall = '';
 our $entryfields = 1;	# contest dependant
 our $activefield = 'call';
 
