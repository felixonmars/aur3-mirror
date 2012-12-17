# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: multimedia
pkgname=tapehead
pkgver=0.2.2
pkgrel=1
pkgdesc="Record radio programmes"
url="http://www.bwalle.de/drupal/tapehead"
license="GPL"
depends=(python2 libnewt)
builddepends=(python2)
arch=(i686 x86_64)
source=(http://www.bwalle.de/programme/${pkgname}/releases/$pkgname-$pkgver.tar.bz2)
md5sums=('424ba5235e7d6760319c9c66b8b1744c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  python2 setup.py build
  mkdir -p $startdir/pkg/
  python2 setup.py install --prefix=/usr --root=$startdir/pkg
}
# :mode=shellscript:
