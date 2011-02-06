# Contributor: Baptiste Grenier <gwarf@gwarf.org>
pkgname=lazy
pkgver=0.24e
pkgrel=1
pkgdesc="A console-based CD player"
arch=('i686' 'x86_64')
url="http://lucasvr.gobolinux.org/"
license=('GPL')
groups=
provides=
depends=('glibc')
makedepends=()
conflicts=()
replaces=()
backup=()
install=()
source=(http://lucasvr.gobolinux.org/projs/lazy/$pkgname-$pkgver.tar.bz2)
md5sums=('27fc83333c032276a7e6baca47a75e8b')
 
build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=$startdir/pkg/etc
  make || return 1
  make prefix=$startdir/pkg/usr install
}
