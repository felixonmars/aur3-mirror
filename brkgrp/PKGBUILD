# Maintainer: Vamp898 <vamp898@ignaz.org>
pkgname=brkgrp
pkgver=0.8.20
pkgrel=1
pkgdesc="Find not-installed packages of a group"
arch=( 'i686' 'x86_64' )
url="https://bbs.archlinux.org/viewtopic.php?pid=1001780"
license=('GPLv2')
depends=('bash')
source=(http://ignaz.org/$pkgname-$pkgver.tar.gz)

package() {
  cd $srcdir
  mkdir -p $pkgdir/usr/bin/
  cp $pkgname $pkgdir/usr/bin/
}
md5sums=('b1c2209e9cba8cc1618b88598284155b')
