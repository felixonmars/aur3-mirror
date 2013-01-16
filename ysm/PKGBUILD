# Maintainer:  TDY <tdy@archlinux.info>
# Contributor: Peter Mykytyn <mykytyn@centrum.cz>

pkgname=ysm
pkgver=2.9.9.1
pkgrel=1
pkgdesc="A powerful console client for ICQ"
arch=('i686' 'x86_64')
url="http://ysmv7.sourceforge.net/"
license=('GPL')
depends=('readline')
source=(http://downloads.sourceforge.net/ysmv7/ysmv7_${pkgver//./_}.tar.bz2)
md5sums=('cec01db290152ca969050d393ff0e7a9')

build() {
  cd "$srcdir/ysmv7_${pkgver//./_}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/ysmv7_${pkgver//./_}"
  install -Dm755 src/ysm "$pkgdir/usr/bin/ysm"
  install -Dm644 src/man/ysm.1 "$pkgdir/usr/share/man/man1/ysm.1"
}

# vim:set ts=2 sw=2 et:
