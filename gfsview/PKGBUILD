# Contributor: Brice Méalier <mealier_brice@yahoo.fr>
pkgname=gfsview
pkgver=0.4.2
pkgrel=1
pkgdesc="Viewer for the Gerris flow solver."
url="http://gfs.sourceforge.net/"
license="GPL"
depends=('gerris' 'gtkglext' 'mesa')
makedepends=('pkgconfig')
source=(http://dl.sourceforge.net/sourceforge/gfs/$pkgname-$pkgver.tar.gz)
md5sums=('5233484bfac321f27f01ca5287ca5fbe')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
