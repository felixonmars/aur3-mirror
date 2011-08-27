# Contributor: Paul Colomiets <pc@gafol.net>

pkgname=python-csvn
pkgver=1.6.9
pkgrel=2
pkgdesc="Stock subversion bindings for python"
arch=('i686' 'x86_64')
license=('apache' 'bsd')
makedepends=('python' 'subversion' 'ctypesgen')
source=(http://subversion.tigris.org/downloads/subversion-$pkgver.tar.bz2)
url="http://subversion.tigris.org/"
options=('!makeflags' '!libtool')
md5sums=('9c30a47b1d48664e7afef68bb4834c53')

build() {
   cd ${srcdir}/subversion-${pkgver}/subversion/bindings/ctypes-python || return 1
   python setup.py build || return 1
   python setup.py install --root=$pkgdir/ --optimize=1 || return 1
}
