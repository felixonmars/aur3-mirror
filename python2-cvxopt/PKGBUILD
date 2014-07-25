# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: BinkyTheClown <binky_at_archlinux_dot_us>
pkgname='python2-cvxopt'
pkgver=1.1.7
pkgrel=1
pkgdesc="A free software package for convex optimization written in Python"
url="http://cvxopt.org/"
arch=('x86_64' 'i686')
license=('GPL3')
depends=('python2' 'lapack')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cvxopt/cvxopt/archive/${pkgver}.tar.gz")
sha1sums=('199ae22f7175be8e46b277993eea7c39e30da1f1')

build() {
    cd "$srcdir"/cvxopt-$pkgver
    python2 setup.py build
}

package() {
    cd "$srcdir"/cvxopt-$pkgver
    python2 setup.py install --root="$pkgdir"/ --optimize=1
}

