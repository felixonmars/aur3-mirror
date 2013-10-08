# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=vils  
pkgver=1.1
pkgrel=1 
pkgdesc="A zsh script for using an editor to rename files"
url="http://www.freebsdsoftware.org/sysutils/vils.html"
arch=('i686' 'x86_64')
license=('custom:BSD')
depends=('zsh')
source=(http://www.secnetix.de/~olli/scripts/Generic-utilities/$pkgname)
md5sums=('cad9cd336a31154765bba8a55aecebf1')
build() {
  cd $srcdir
  install -Dm755 vils $pkgdir/usr/bin/vils || return 1
  install -d $pkgdir/usr/share/licenses/vils
  cat vils|head -5|tail -1>$pkgdir/usr/share/licenses/vils/license
}