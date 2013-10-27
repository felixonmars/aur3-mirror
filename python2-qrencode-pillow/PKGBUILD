# Maintainer: max-k <max-k at post dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: sevkin <vsevolod at balashov dot name>

_python=python2
_name=qrencode-pillow
pkgname="${_python}-${_name}"
pkgver=1.01
pkgrel=1
pkgdesc="Encodes QR-codes. Patched to work with Pillow."
arch=('i686' 'x86_64')
url="https://github.com/max-k/pyqrencode/"
license=('Apache')
depends=("${_python}" 'qrencode')
makedepends=('gcc')
conflicts=('python2-qrencode')
source=("https://github.com/max-k/pyqrencode/archive/master.tar.gz")
md5sums=('6f1566633df99dd42f6f43546e185cd2')

build() {
    cd "${srcdir}/pyqrencode-master"
    export PYTHON="/usr/bin/${_python}"
    ${_python} setup.py build
}

package() {
    cd "${srcdir}/pyqrencode-master"
    ${_python} setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
