# Maintainer: Guenther Starnberger <guenther at starnberger dot name>

pkgname=ddar
pkgver=0.1
pkgrel=2
pkgdesc="Free de-duplicating archiver for Unix."
arch=('any')
url='http://www.synctus.com/ddar/'
license=('GPLv3')
depends=('python2' 'python2-protobuf')
makedepends=('setuptools')
source=("http://www.synctus.com/bits/ddar/ddar-sdist-$pkgver.tar.gz")
md5sums=('b28d519e6ae8bacc0dc39da28cae9b52')

build() {
  cd "$srcdir/ddar-$pkgver"
  python2 setup.py install --root="$pkgdir" || return 1

  # Source package is missing __init__.py
  find $pkgdir -name synctus -exec touch {}/__init__.py \;
}
