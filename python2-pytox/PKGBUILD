# Maintainer: Wei-Ning Huang <aitjcize@gmail.com>
pkgname=python2-pytox
_pkgname=PyTox
pkgver=20140816
pkgrel=1
pkgdesc="Python binding for Project-Tox the skype replacement"
arch=('i686' 'x86_64')
url="https://github.com/aitjcize/PyTox"
license=('GPL')
makedepends=(git)
depends=(python2 tox-git)
source=("git://github.com/aitjcize/${_pkgname}")
sha256sums=("SKIP")

pkgver() {
  date '+%Y%m%d'
}

build() {
  cd ${_pkgname}
  python2 setup.py build
}

package() {
  cd ${_pkgname}
  python2 setup.py install --root=${pkgdir}/ --optimize=1
}
