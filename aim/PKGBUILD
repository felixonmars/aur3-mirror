# Maintainer: Timothy Hoffmeyer <tim.hoffmeyer [at] archlinux [dot] us>

pkgname=aim
pkgver=1.5.286
pkgrel=5
arch=(any)
license=('LGPL')
pkgdesc="AOLs official AIM client for linux"
source=(http://ftp.newaol.com/aimgen/380469/$pkgname-$pkgver.tgz)
url="http://www.aim.com"
md5sums=('c724e43269e31947e4aa0fec3b4d5e50')
depends=('gtk' 'glib')
install=aim.install

build() {
  mv $startdir/src/usr $startdir/pkg/
}

