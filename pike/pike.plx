#!/usr/bin/env perl


# Created by Alexej Magura <agm2819*gmail*> for use with
#> the pike package.


#chomp($pwd = `whereis pike | grep -P "\/[u][s][r]\/[b][i][n]\/" -o`);
$pwd = "nil";

$pkgver = "7.8.700"

if ( $pwd =~ m/^\/[u][s][r]\/[b][i][n]\/?$/ )
{
  exec "sh /usr/lib/pike/$pkgver/bin/pike @ARGV";
}
else
{
  exec "sh ../lib/pike/$pkgver/bin/pike @ARGV";
}
