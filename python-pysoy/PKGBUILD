# Contributor: rabyte <rabyte__gmail>

pkgname=python-pysoy
pkgver=1.0_beta2
pkgrel=1
pkgdesc="A multi-threaded 3D game engine for Python"
arch=('i686' 'x86_64')
url="http://www.pysoy.org/"
license=('GPL3')
depends=('glib2' 'python>=2.3' 'glew>=1.4' 'ode>=0.8' 'cairo>=1.4' 'libtheora>=beta2')
source=(http://www.pysoy.org/releases/pysoy-1.0-beta2.tar.bz2)
md5sums=('5f7756ab09cf537a22beaaf745eeda77')

build() {
  cd $srcdir/pysoy-${pkgver//_/-}

  sed '1339iint dEpsilon;' -i src/_core-x11/soy._core.c
  sed 's|dEpsilon|int dEpsilon|' -i include/ode.pxd

  python setup.py build || return 1
  python setup.py install --root=$pkgdir
}

# vim:set ts=2 sw=2 et:
