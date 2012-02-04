# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
pkgname=gerris
pkgver=0.9.2
pkgrel=1
pkgdesc="Gerris is an Open Source Free Software for the solution of the partial differential equations describing fluid flow."
url="http://gfs.sourceforge.net/"
license="GPL"
depends=('glib' 'gts')
options=('KEEPDOCS' 'NOLIBTOOL')
source=(http://dl.sourceforge.net/sourceforge/gfs/$pkgname-$pkgver.tar.gz)
md5sums=('94e0fe2089052a3e6c689f85148388bc')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
