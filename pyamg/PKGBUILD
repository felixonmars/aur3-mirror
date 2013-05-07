# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>
pkgname=pyamg
pkgver=2.0.5
pkgrel=2
pkgdesc="Algebraic Multigrid Solvers in Python"
arch=('i686' 'x86_64')
url="http://www.pyamg.org/"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'python2-nose' 'python2-matplotlib')
makedepends=('python2-distribute')
source=(http://pyamg.googlecode.com/files/${pkgname}-${pkgver}.tar.gz)
sha1sums=('185cde644f343493a737b4c005034e5b4ccbaeb3')

build() {
   cd "${srcdir}/${pkgname}"
   python2 setup.py build
}

package() {
   cd "${srcdir}/${pkgname}"
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
}
