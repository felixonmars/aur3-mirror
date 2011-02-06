# Contributor: Tapi <tapi@syskall.net>
# Maintainer: Tapi <tapi@syskall.net>

pkgname=rcman
pkgver=0.3.1
pkgrel=1
_machine=`uname -m`
pkgdesc="Manages the DAEMONS array in /etc/rc.conf, controls and displays information about services"
arch=(i686 x86_64)
url="http://bugs.archlinux.fr/index.php?tasks=all&project=4"
license=('GPL')
depends=(gmp)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=()
md5sums=()
noextract=()

build() {
  cd $startdir/src
  wget http://www.syskall.net/~tapi/$pkgname/$pkgver/$pkgname-$_machine.gz \
       http://www.syskall.net/~tapi/$pkgname/$pkgver/$pkgname-$_machine.gz.md5
  echo -n "Checking md5sum of "
  md5sum -c $pkgname-$_machine.gz.md5 || exit 1
  gzip -df $pkgname-$_machine.gz
  mkdir -p $startdir/pkg/usr/bin
  install -T -s -m 755 $pkgname-$_machine $startdir/pkg/usr/bin/$pkgname
}
