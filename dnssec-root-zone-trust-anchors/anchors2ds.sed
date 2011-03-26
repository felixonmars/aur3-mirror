#!/bin/sed -f
# anchors2ds.sed - (C)opyright Thomas Mudrunka <tomas.mudrunka@gmail.com> (2010) - All rights waived
# This SED script converts trust anchors supplied by IANA in XML format to DS format usable by most applications.
:a;$!N;s/\n//g;ta;
s/<?xml [^<]*//g;s/<TrustAnchor[^<]*<Zone>\([^<]*\)<\/Zone>[^<]*<[^<]*<KeyTag>\([^<]*\)<\/KeyTag>[^<]*<Algorithm>\([^<]*\)<\/Algorithm><DigestType>\([^<]*\)<\/DigestType>[^<]*<Digest>\([^<]*\)<\/Digest><\/KeyDigest><\/TrustAnchor>/\1 DS \2 \3 \4 \5\n/g
