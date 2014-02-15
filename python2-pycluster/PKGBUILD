# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pycluster
pkgver=1.52
pkgrel=1
pkgdesc="Clustering routines for Python"
arch=('i686' 'x86_64')
url="http://bonsai.hgc.jp/~mdehoon/software/cluster/software.htm"
license=('PSF')
depends=('python2-numpy')
makedepends=('python2-setuptools')
options=(!emptydirs)

source=("http://bonsai.hgc.jp/~mdehoon/software/cluster/Pycluster-$pkgver.tar.gz")
md5sums=('2804c1709e11745997c7d537f7d1d7ad')

build() {
  cd "$srcdir/Pycluster-$pkgver"

  python2 setup.py build
}

package() {
  cd "$srcdir/Pycluster-$pkgver"

  python2 setup.py install --root="$pkgdir"/ --optimize=1 || return 1
}

