# Contributor: Tony Dodd <arch@recalcitrance.net>
pkgname=rwhois-client
pkgver="1.6.1"
pkgrel=1
pkgdesc="RWhois 1.5 (protocol version) C client library and command line tool, version 1.6.1 of the C client codebase"
arch=('i686' 'x86_64')
url="http://www.rwhois.net/"
license=('GPL')
source=("http://www.rwhois.net/ftp/rwhois-client-${pkgver}.tar.gz")
md5sums=('bf8c6af4e4774e1ce98826237361ddb9')

build() {
  cd "$startdir/src/rwhois-client-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  install -D rwhois-src/rwhois "$startdir/pkg/usr/bin/rwhois"
  mkdir -p "$startdir/pkg/usr/lib"
  cp lib-src/librwhois.a "$startdir/pkg/usr/lib"
  mkdir -p "$startdir/pkg/usr/include"
  cp lib-src/rwhois.h "$startdir/pkg/usr/include"
  mkdir -p "$startdir/pkg/usr/share/man/man1"
  cp rwhois-src/rwhois.1 "$startdir/pkg/usr/share/man/man1"
}

# vim:set ts=2 sw=2 et:
