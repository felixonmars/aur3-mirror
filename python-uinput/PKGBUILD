# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

_basepkgname=python-uinput
pkgname=python-uinput
true && pkgname=(python-uinput python2-uinput)
pkgver=0.10.1
pkgrel=1
pkgdesc="Simple Python API to the Linux uinput-system"
arch=('i686' 'x86_64')
url="http://codegrove.org/projects/python-uinput/"
license=('LGPL3')
depends=('python' 'python2')
source=(http://pypi.python.org/packages/source/p/${_basepkgname}/${_basepkgname}-${pkgver}.tar.gz)
md5sums=('823935c108ae8a142f6968febe15a585')

prepare() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  sed -i "s/libudev.so.0/libudev.so.1/" setup.py
}

build() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  mkdir -p build_py3
  python setup.py build --build-base=${srcdir}/${_basepkgname}-${pkgver}/build_py3


  mkdir -p build_py2
  python2 setup.py build --build-base=${srcdir}/${_basepkgname}-${pkgver}/build_py2
}

package_python-uinput() {
  true && depends=('python')
  cd ${srcdir}/${_basepkgname}-${pkgver}
  python setup.py install --root="${pkgdir}"
}

package_python2-uinput() {
  true && depends=('python2')
  cd ${srcdir}/${_basepkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}

