# Maintainer: Ludovic Fauvet < etix (at) l0cal (dot) com >

pkgname=doxypy
pkgver=0.4.2
pkgrel=1
pkgdesc='Python input filter for Doxygen.'
url='http://code.foosel.org/doxypy'
license='GPL'
arch=('i686' 'x86_64')
depends=('python>=2.5', 'doxygen')
makedepends=('setuptools')
conflicts=('doxypy' 'doxypy-git')
replaces=('doxypy' 'doxypy-git')
provides=('doxypy')
source=(http://code.foosel.org/files/${pkgname}-${pkgver}.tar.gz)
md5sums=('530aed0d61b75c28586ad62aef6ab598')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  msg 'Running setup.py'
  python setup.py build || return 1
  python setup.py install --root=$pkgdir || return 1
}
