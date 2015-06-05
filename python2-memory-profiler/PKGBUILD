# Maintainer: John Regan <john@jrjrtech.com>

pkgname=python2-memory-profiler
_pypiname=memory_profiler
pkgver=0.32
pkgrel=1
pkgdesc='A module for monitoring memory usage of a Python program'
_pypiurl='https://pypi.python.org/'
url="${_pypiurl}pypi/${_pypiname}"
arch=('any')
license=('BSD')
makedepends=('python2-setuptools')
source=("${_pypiurl}packages/source/m/${_pypiname}/${_pypiname}-${pkgver}.tar.gz")
md5sums=('c65310467e05d8db4b10fa65534f3e5d')

build() {
    cd "${srcdir}/${_pypiname}-${pkgver}"
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_pypiname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=4 sw=4 et:
