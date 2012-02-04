# $Id$
# Maintainer:  <wamba@centrum.cz>
pkgname=leave
pkgver=1.12
pkgrel=1
pkgdesc="Leave waits until the specified time, then reminds you that you have to leave."
url="http://packages.debian.org/stable/utils/leave"
license=""
depends=()
makedepends=(deb2targz)
conflicts=()
replaces=()
backup=()
install=
source=(http://ftp.cz.debian.org/debian/pool/main/l/$pkgname/$pkgname\_$pkgver-1\_i386.deb)
md5sums=('40c52f47fb8038d2907496eb65f32a3f')

build() {
  cd $startdir/
  deb2targz $pkgname\_$pkgver-1_\i386.deb
  tar xvzf $pkgname\_$pkgver-1_\i386.tar.gz -C $startdir/pkg
}