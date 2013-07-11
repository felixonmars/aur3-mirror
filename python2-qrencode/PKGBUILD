# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: sevkin <vsevolod at balashov dot name>

_python=python2
_name=qrencode
pkgname="${_python}-${_name}"
pkgver=1.01
pkgrel=4
pkgdesc="Encodes QR-codes."
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/${_name}"
license=('Apache')
depends=("${_python}" 'qrencode')
makedepends=('gcc')
source=("http://pypi.python.org/packages/source/q/${_name}/${_name}-${pkgver}.tar.gz")
md5sums=('5a1addd4d6e6412116fcfeb9661831a9')

build() {
    cd "${_name}-${pkgver}"
    export PYTHON="/usr/bin/${_python}"
    ${_python} setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
