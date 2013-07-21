#!/usr/bin/perl

$pkgname = 'epsxe'; 
$pkgver = '1.6.0';
$pkgpath = "/opt/$pkgname/$pkgver";

system("cd $pkgpath ; ./$pkgname");

