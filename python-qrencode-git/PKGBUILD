# Maintainer: max-k <max-k at post dot com>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: sevkin <vsevolod at balashov dot name>

_python=python
pkgname="${_python}-qrencode-git"
_gitname=pyqrencode
pkgver=20131226.486bb7b
pkgrel=1
pkgdesc="Encodes QR-codes. Patched to work with Pillow."
arch=('i686' 'x86_64')
url="https://github.com/Arachnid/${_gitname}/"
license=('Apache')
depends=("${_python}" 'qrencode')
conflicts=("${_python}-qrencode" "${_python}-qrencode-pillow")
source=("git://github.com/Arachnid/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  _rev=$(git rev-parse --short HEAD)
  _date=$(date +%Y%m%d -d "@$(git show --format="%at" ${rev} | head -n1)")
  echo ${_date}.${_rev}
}

build() {
    cd "${srcdir}/${_gitname}"
    export PYTHON="/usr/bin/${_python}"
    ${_python} setup.py build
}

package() {
    cd "${srcdir}/${_gitname}"
    ${_python} setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}
