# Contributor: Stefano Zamprogno <stefano.zamprogno@gmail.com> 
pkgname=pacworld3
pkgver=0.3.9
pkgrel=4
pkgdesc="Tool to check pacman database consistency and fix broken packages"
url="http://www.zamprogno.it/"
arch=(any)
license="GPL"
depends=('python')
makedepends=()
source=(http://dl.dropbox.com/u/7614523/Archlinux/AUR/pacworld/$pkgname-$pkgver.tar.xz)
md5sums=('ca570eba7f90ad9dc824991fc07ac431')
backup=(etc/$pkgname/pacworld3.not)

build() {
  cd $startdir/src/$pkgname
  install -D -m 644 $pkgname.not $startdir/pkg/etc/$pkgname/$pkgname.not
  install -D -m 755 $pkgname.py $startdir/pkg/usr/bin/$pkgname
}
