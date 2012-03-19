# Maintainer: Tianjiao Yin <ytj000@gmail.com>

pkgname=python-sphinx-doc
pkgver=1.1.3
pkgrel=1
pkgdesc="Documentation for sphinx (A python documentation generator)"
arch=('any')
url="http://sphinx.pocoo.org/"
license=('GPL')
makedepends=('python-sphinx')
source=(http://pypi.python.org/packages/source/S/Sphinx/Sphinx-$pkgver.tar.gz)
md5sums=('8f55a6d4f87fc6d528120c5d1f983e98')

build() {
    cd "$srcdir/Sphinx-$pkgver"
    cd doc
    make html SPHINXBUILD=sphinx-build
}

package() {
    cd "$srcdir/Sphinx-$pkgver/doc/_build"
    _docdir="${pkgdir}/usr/share/doc/"
    mkdir -p ${_docdir}
    mv html "${_docdir}/python-sphinx"
}
