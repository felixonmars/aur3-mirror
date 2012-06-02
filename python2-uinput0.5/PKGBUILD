# Contributor: Nuno Araujo <nuno.araujo at russo79.com>

_basepkgname=python-uinput
pkgname=python2-uinput0.5
pkgver=0.5
pkgrel=3
pkgdesc="Simple Python API to the Linux uinput-system"
arch=('i686' 'x86_64')
url="http://codegrove.org/projects/python-uinput/"
license=('LGPL3')
depends=('python2' 'libsuinput')
source=(http://pypi.python.org/packages/source/p/${_basepkgname}/${_basepkgname}-${pkgver}.tar.gz)
md5sums=('70fd7db4a0697097b826e3f01df90b02')

build() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  sed -i "s/Extension('uinput/Extension('uinput0_5/" setup.py
  sed -i "s/name='python-uinput'/name='python-uinput0_5'/" setup.py
  sed -i "s/package_dir={'uinput'/package_dir={'uinput0_5'/" setup.py
  sed -i "s/packages=\['uinput'\]/packages=\['uinput0_5'\]/" setup.py
  sed -i "s/from uinput/from uinput0_5/" src/__init__.py

  python2 setup.py build
}

package() {
  cd ${srcdir}/${_basepkgname}-${pkgver}
  python2 setup.py install --root="${pkgdir}"
}

