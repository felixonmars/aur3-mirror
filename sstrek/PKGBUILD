# Contributor: Michael Blum michaeldblum@earthlink.net
# $Id: PKGBUILD,v 1.11 2004/04/12 23:54:38 judd Exp $
pkgname=sstrek
pkgver=1.0.0
pkgrel=1
pkgdesc="Classic text based Super Star Trek"
url="http://www.almy.us/sst.html"
depends=()
makedepends=(gcc sed)
source=(http://www.almy.us/files/sstlinux.tar.gz http://www.almy.us/files/sstsrc.zip)
md5sums=('c47f1508f5a599ed4f8808bbda1de7b9' 'd001cd08e0cf88deebf09e4942e46a86')

build() {
  cd $startdir/src/
  cp sst.c sst-orig.c
  sed 137s#sst.doc#/usr/share/sstrek/sst.doc# sst-orig.c > sst.c
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  cp sst $startdir/pkg/usr/bin
  mkdir -p $startdir/pkg/usr/share/sstrek
  cp sst.doc $startdir/pkg/usr/share/sstrek
}
