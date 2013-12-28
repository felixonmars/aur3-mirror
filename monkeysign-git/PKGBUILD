# Maintainer: max-k <max-k AT post DOT com>

pkgname=monkeysign-git
_gitname=monkeysign
pkgver=20131227.ff45f60
pkgrel=1
pkgdesc="OpenPGP Key Exchange for Humans"
arch=('any')
url="http://web.monkeysphere.info/${_gitname}/"
license=('GPL3')
depends=('python2-qrencode-git' 'pygtk' 'zbar')
makedepends=('python2-setuptools' 'python2-docutils')
source=("git://git.monkeysphere.info/${_gitname}")
md5sums=('SKIP')

pkgver() {
  cd ${_gitname}
  _rev=$(git rev-parse --short HEAD)
  _date=$(date +%Y%m%d -d "@$(git show --format="%at" ${rev} | head -n1)")
  echo ${_date}.${_rev}
}

build() {
    cd "${srcdir}/${_gitname}"
    sed -i 's/rst2s5/rst2s52/' ${_gitname}/documentation.py
    sed -i 's#presentation.rst#doc/presentation.rst#' setup.cfg
    python2 setup.py build
}

package() {
    cd "${srcdir}/${_gitname}"
    python2 setup.py install --root="${pkgdir}" --prefix="/usr" --optimize=1
}

