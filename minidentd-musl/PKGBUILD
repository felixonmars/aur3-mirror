# Maintainer: David Arroyo <droyo@aqwari.us>
pkgname=minidentd-musl
pkgver=0.16
pkgrel=1
pkgdesc="A small ident server"
arch=('i686' 'x86_64')
url="http://www.skarnet.org/software/minidentd"
license=('custom:ISC')
changelog=CHANGELOG
makedepends=(skalibs musl)
provides=(minidentd)
source=("${url}/minidentd-$pkgver.tar.gz")
md5sums=('f048cf12002c1d4999b963814572919d')

build() {
  cd "$srcdir/net/minidentd-$pkgver"
  echo musl-gcc                 > conf-compile/conf-cc
  echo musl-gcc -static         > conf-compile/conf-ld
  echo musl-gcc                 > conf-compile/conf-dynld
  echo /usr/lib/skalibs/sysdeps > conf-compile/import
  echo /usr/include/skalibs     > conf-compile/path-include
  echo /usr/lib/skalibs         > conf-compile/path-library
  rm -f conf-compile/flag-slashpackage
  rm -f conf-compile/flag-allstatic
  package/compile
}

package() {
  cd "$srcdir/net/minidentd-$pkgver"
  mkdir -p $pkgdir/usr/bin
  install `sed s,^,command/, package/command.exported` "$pkgdir/usr/bin"
  install -D -m644 package/COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
