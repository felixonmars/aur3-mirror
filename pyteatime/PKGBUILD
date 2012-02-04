# Contributor: Bernhard Walle <bernhard.walle@gmx.de>
pkgname=pyteatime
pkgver=0.2.1
pkgrel=1
pkgdesc="Teacooker in PyGtk"
url="http://www.bwalle.de/drupal/pyteatime"
license="GPL"
depends=()
builddepends=(python)
arch=(i686 x86_64)
source=(http://www.bwalle.de/programme/${pkgname}/$pkgname-$pkgver.tar.bz2)
md5sums=('d66047e7c9dd8e989b39c8a90a03db69')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python setup.py build
  mkdir -p $startdir/pkg/
  python setup.py install --prefix=/usr --root=$startdir/pkg
}
