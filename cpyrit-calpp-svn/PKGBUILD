# Maintainer: Martin R. <mr-ger [at] hotmail [dot] com>
pkgname=cpyrit-calpp-svn
pkgver=308
pkgrel=4
pkgdesc="CAL++ backend for accelerated attack against WPA-PSK authentication, development version"
url="http://code.google.com/p/pyrit/"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('python2' 'catalyst-utils' 'pyrit-svn')
makedepends=('calpp' 'boost')
conflicts=('cpyrit-opencl-svn')

_svntrunk='http://pyrit.googlecode.com/svn/trunk'
_svnmod='cpyrit_calpp'
_caldir='/usr/include/CAL/'

build() {
  svn co "${_svntrunk}/${_svnmod}"

  cd "${_svnmod}"

  sed -i "s|VERSION = '0.4.0-dev'|VERSION = '0.4.1-dev'|" setup.py
  sed -i "s|CALPP_INC_DIRS = \[\]|CALPP_INC_DIRS = \[\'${_caldir}\'\]|" setup.py
  LDFLAGS="" python2 setup.py build
}

package() {
  cd "${srcdir}/${_svnmod}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}
