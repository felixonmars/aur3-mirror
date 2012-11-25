#!/usr/bin/perl

use strict;
use warnings;

use MediaWiki::API;

binmode STDOUT, ":utf8";

my $mw = MediaWiki::API->new();
$mw->{config}->{api_url} = 'http://en.wikiquote.org/w/api.php';

# TODO fetch a specific, stable revision

$_ = $mw->get_page( { title => 'Farscape' } )->{ '*' };

# remove everything after, and including, the cast section
s/== Cast ==.*$//s;

# create seperators from horizontal rules, {,sub}section boundaries, quotes
s/^\s*<hr.+?\/>\s*$/%/gim;

s/^===.+?===$/%/gm;

s/^==.+?==$/%/gm;

s/^\s*\*\s*$/%/gm;

# remove empty lines
s/\n{2,}/\n/g;

# collapse any multiple occurances of '%'
s/%\n(%\n)+/%\n/g;

# remove preceding whitespace
s/^\s+//gm;

# remove everything before, and including, the first '%'
s/.*?%\n//s;

# remove leading colons
s/^://gm;

# collapse bold and italic text.
s/'''(.+?)'''/$1/g;

s/''(.+?)''/$1/g;

# replace wiki links with just the text
s/\[\[w:.+?\|(.+?)\]\]/$1/g;

print;
