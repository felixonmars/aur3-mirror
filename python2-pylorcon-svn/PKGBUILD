pkgname=python2-pylorcon-svn
_pkgname=python2-pylorcon
pkgver=26
pkgrel=1
pkgdesc='Wrapper for the LORCON (Loss Of Radio CONnectivity) library (git version)'
url='http://code.google.com/p/pylorcon2/'
arch=('i686' 'x86_64')
license=('GPL')
makedepends=('subversion')
depends=('lorcon-git' 'python2')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${_pkgname}::svn+http://pylorcon2.googlecode.com/svn/trunk/")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup.py install --root=${pkgdir}
}

pkgver() {
    cd "${srcdir}/${_pkgname}"
    svnversion
}
