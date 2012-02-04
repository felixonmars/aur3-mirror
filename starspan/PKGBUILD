# Contributor: Dominik Fuchs <dominik.fuchs@wur.nl>

pkgname=starspan
pkgver=1.2.03
pkgrel=1
pkgdesc="Software for fast pixel level extraction from geometry features (points, lines, polygons)"
url="http://starspan.projects.atlas.ca.gov/"
arch=('i686' 'x86_64')
license=('custom')
depends=('geos' 'gdal')
source=(http://projects.atlas.ca.gov/frs/download.php/667/${pkgname}-${pkgver}.tar.gz
gcc4.3.patch)

md5sums=('6d492358fc7a3096ec189156841a95c5'
         '1dea78bfd5123608f66eb6f05b58c75e')

build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 -i $srcdir/gcc4.3.patch
  ./configure --prefix=/usr # --with-grass=/opt/grass
  make || return 1
  make DESTDIR=$startdir/pkg install
  install -D -m644 ${srcdir}/${pkgname}-${pkgver}/COPYING ${startdir}/pkg/usr/share/licenses/${pkgname}/COPYING
}

