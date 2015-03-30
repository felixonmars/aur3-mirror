# Maintainer: Tom Kuther <archlinux@kuther.net>

pkgname=ocenaudio
pkgver=2.0.15
pkgrel=1
pkgdesc="A cross-platform, easy to use, fast and functional audio editor"
arch=('i686' 'x86_64')
url="http://www.ocenaudio.com.br/"
license=('as-is')
depends=('qt4')
optdepends=()

source_i686=("http://www.ocenaudio.com.br/downloads/${pkgname}32.deb")
source_x86_64=("http://www.ocenaudio.com.br/downloads/${pkgname}64.deb")

sha256sums_i686=('144a8df3d70ea5d6d0e2cb10eefc3607d282fbb256823a0b6d97da18686ab73b')
sha256sums_x86_64=('ad8d2cf6c5e3a861e753010f865a766d9d2a784d7038e741a4ad2c6f94007b54')

build() {
  bsdtar -xf ${pkgname}*.deb data.tar.gz
  bsdtar -xf data.tar.gz
  rm data.tar.gz
  cd $srcdir/opt/$pkgname/lib
}

package() {
  cd $srcdir
  install -d -m 755 $pkgdir/opt/$pkgname/{lib,bin}
  install -d -m 755 $pkgdir/usr/share
  install -d -m 755 $pkgdir/usr/bin
  install -m 755 opt/$pkgname/bin/$pkgname $pkgdir/opt/$pkgname/bin/
  cp -d opt/$pkgname/lib/* $pkgdir/opt/$pkgname/lib/.
  cp -dR usr/share/applications $pkgdir/usr/share/.
  cp -dR usr/share/icons $pkgdir/usr/share/.

  ln -sf /opt/ocenaudio/bin/ocenaudio $pkgdir/usr/bin/ocenaudio
}
# vim:set ts=2 sw=2 et:
