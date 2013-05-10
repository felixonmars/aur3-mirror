 # Maintainer: Ansgar Taflinski <ataflinski@uni-koblenz.de>
pkgname=pymagellan
pkgver=0.1
pkgrel=1
pkgdesc="A Tool for creating map images for GPS devices by Magellan"
arch=(any)
url="http://ptpd.sourceforge.net/"
license=('GPL')
depends=(python2 python2-numpy gdal-svn libpng15)
makedepends=(python2-distribute)
source=("http://sourceforge.net/projects/pymag/files/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
noextract=()
md5sums=('8b7ca95f63c8fc4b0a66c21066a9618f')

build() {
  sed -i 's/python/python2/g' $srcdir/$pkgname-$pkgver/osmmagellan/osmmag.py
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}