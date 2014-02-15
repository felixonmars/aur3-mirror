# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python2-unum
pkgver=4.1.1
_tag=409befe069ac
pkgrel=1
pkgdesc="Units in Python"
arch=('any')
url="http://home.scarlet.be/be052320/Unum.html"
depends=('python2')
makedepends=('python2-setuptools')
license=('LGPL')
options=(!libtool)
source=(http://bitbucket.org/kiv/unum/get/${_tag}.zip)
md5sums=('ea69065e6566ff6a1663d75ec2060af2')


build() {
  cd "${srcdir}"/kiv-unum-${_tag}

  python2 setup.py build
}

package() {
  cd "${srcdir}"/kiv-unum-${_tag}

  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

