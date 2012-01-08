# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Łukasz Fidosz <virhilo@gmail.com>
# Maintainer: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ketchup
pkgver=1.1
pkgrel=1
pkgdesc="Tool for updating or switching between versions of the Linux kernel source."
url="https://github.com/psomas/ketchup/"
license="GPL"
arch=('i686' 'x86_64')
depends=('python2')
source=(https://github.com/psomas/$pkgname/tarball/v$pkgver-beta2)
md5sums=('8c3a888d18ea487b5f2c2703e184c68c')

build() {
  cd $startdir/src/psomas-ketchup-*
  sed -i 's@#!/usr/bin/python@#!/usr/bin/python2@g' ketchup
  install -D -m755 ketchup	$startdir/pkg/usr/bin/ketchup
  install -D -m644 ketchup.1	$startdir/pkg/usr/man/man1/ketchup.1
}
