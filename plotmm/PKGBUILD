# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=(plotmm)
pkgver=0.1.2
pkgrel=1
pkgdesc="PlotMM - GTKmm plot widget for scientific applications."
arch=('i686' 'x86_64')
url="http://plotmm.sourceforge.net/"
license=('GPL')
depends=('gtkmm')
source=(http://downloads.sourceforge.net/project/plotmm/plotmm/$pkgver/$pkgname-$pkgver.tar.gz
	gtkm24-fixes.patch)
md5sums=('d8a49db390be5de5965e52ef8d8581f3'
         '0174c77865fbf95a25c38731c79745f6')

build() {
  cd $srcdir/$pkgname-$pkgver

  patch -p1 -R -i ../gtkm24-fixes.patch || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  cd $pkgdir/usr/bin || return 1
  mv simple plotmm-simple && mv curves plotmm-curves || return 1
}

