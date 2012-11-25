# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

_basepkgname=python-uinput
pkgname=python2-uinput
pkgver=0.9
pkgrel=1
pkgdesc="Simple Python API to the Linux uinput-system"
arch=('i686' 'x86_64')
url="http://codegrove.org/projects/python-uinput/"
license=('LGPL3')
depends=('python2')
source=(http://pypi.python.org/packages/source/p/${_basepkgname}/${_basepkgname}-${pkgver}.tar.gz)
md5sums=('60b93dea0d3503024c12e3213ffe31bc')

build() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}

