# Contributor: William Rea <sillywilly@gmail.com>
pkgname=libmodelfile
pkgver=0.1.92
pkgrel=4
pkgdesc="A collection of small clean C libraries for loading 3D models"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/worldforge"
license="GPL"
depends=()
source=(http://dl.sourceforge.net/sourceforge/worldforge/$pkgname-$pkgver.tar.gz)
md5sums=('53ded1963cc863d0fabba4f0fb4ef2db')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
