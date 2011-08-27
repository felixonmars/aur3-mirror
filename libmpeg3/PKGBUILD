# Contributor: farid abdelnour <farid at atelier-lab.org>
pkgname=libmpeg3
pkgver=1.8
pkgrel=2
pkgdesc="Supports advanced editing and manipulation of MPEG streams"
arch=('i686' 'x86_64')
url="http://heroinewarrior.com/libmpeg3.php"
license=('GPL')
depends=('a52dec')
makedepends=('nasm')
source=(http://prdownloads.sourceforge.net/heroines/libmpeg3-1.8-src.tar.bz2)
md5sums=(a9d0d34e8941a4437eb8e7dfe559eca1)

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install || return 1
}



