# Contributor: Giovanni Scafora <linuxmania@gmail.com>

pkgname=kbilliards
pkgver=0.8.7b
pkgrel=1
pkgdesc="A funny billiards simulator game"
arch=('i686')
url="http://www.hostnotfound.it/kbilliards.php"
license=('GPL')
depends=('kdelibs')
source=(http://www.hostnotfound.it/kbilliards/$pkgname-$pkgver.tar.bz2)
md5sums=('f773a0a860ac0cb678f5e736860a0fe9')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure
  make || return 1
  make prefix=$startdir/pkg/opt/kde install
}
