# Maintainer: Makito Nishimiya <nishimiya a ninja,co,jp>

_module="osprofiler"
pkgname=(python2-osprofiler)
pkgver="0.3.0"
pkgrel="1"
pkgdesc="OpenStack Profiler Library"
arch=("any")
url="https://pypi.python.org/pypi/osprofiler/0.3.0"
license=("Apache")
makedepends=("python2-setuptools" )
source=("https://pypi.python.org/packages/source/o/${_module}/${_module}-${pkgver}.tar.gz")
sha256sums=('7d7e1d0b93ce96901f7a307a712196273818a8f20e59916ff099589b48f53207')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}

