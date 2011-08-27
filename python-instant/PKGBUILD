# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=python-instant
pkgver=0.9.6
pkgrel=5
pkgdesc="Instant inlining of C and C++ code in Python"
arch=('any')
url="http://www.fenics.org/wiki/Instant"
license=('GPL')
depends=('python' 'swig')
source=("http://www.fenics.org/pub/software/instant/v0.9/instant-$pkgver.tar.gz")
md5sums=('2a18be88b391c3c4e021912e6fb9caea')

build() {
  cd $startdir/src/instant-$pkgver
  python setup.py bdist_dumb || exit 1
  cd $startdir/pkg
  tar xzvf $startdir/src/instant-$pkgver/dist/instant-$pkgver.linux*.tar.gz
}
