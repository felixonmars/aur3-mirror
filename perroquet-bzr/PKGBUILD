# Contributor: wido <widomaker2k7@gmail.com>

pkgname=perroquet-bzr
pkgver=83
pkgrel=1
pkgdesc="Perroquet is a educational program to improve playfully your listening in a foreign language"
arch=('i686' 'x86_64')
url="http://perroquet.b219.org"
license=('GPL3')
depends=('python' 'gtk2' 'intltool>=0.40.0' 'pygtk' 'gstreamer0.10-good' 'gstreamer0.10-python')
optdepends=('gstreamer0.10-plugins')
makedepends=('gcc' 'bzr')
conflicts=('perroquet')
provides=('perroquet')
install=perroquet.install
md5sums=()

_bzrtrunk="lp:perroquet"
_bzrmod="trunk"

build() {
    cd ${srcdir}
  msg "Connecting to the server...."

  if [ ! -d ./${_bzrmod} ]; then
    bzr co ${_bzrtrunk} ${_bzrmod} -r ${pkgver}
  else
    bzr up ${_bzrmod}
  fi

  [ -d ./${_bzrmod}-build ] && rm -rf ./${_bzrmod}-build
  cp -r ./${_bzrmod} ./${_bzrmod}-build
  cd ./${_bzrmod}-build
   ./setup.py build || return 1
   ./setup.py --without-icon-cache --without-mime-database --without-desktop-database install --root=${pkgdir}/ || return 1
   }
