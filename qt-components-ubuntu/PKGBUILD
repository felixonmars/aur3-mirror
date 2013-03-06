# Maintainer: Riccardo Ferrazzo <f.riccardo87@gmail.com>

pkgname=qt-components-ubuntu
pkgver=0.1.36
pkgrel=2
pkgdesc="Ubuntu SDK components"
arch=('i686' 'x86_64')
url="http://developer.ubuntu.com/get-started/gomobile/"
license=('GPL')
depends=('qtcreator' 'qt5-declarative' 'qt5-doc' 'qt5-graphicaleffects')
conflicts=('ubuntu-ui-toolkit-bzr')
options=(!makeflags)
source=("https://launchpad.net/~ubuntu-sdk-team/+archive/ppa/+files/${pkgname}_${pkgver}~quantal1.tar.gz" "dirs.patch")
md5sums=('145c23d89c78ec6bd6a7f45988187175'
         'c0c178b0ba96fd8a306109b6989bdeef')

build() {
  export INCLUDE="/usr/include"
  cd "$srcdir/${pkgname}-${pkgver}~quantal1"

  patch -p1 -i $srcdir/dirs.patch

  qmake -r ubuntu-sdk.pro 
  make --quiet
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}~quantal1"
  make INSTALL_ROOT=${pkgdir} install || return 1
}

# vim:set ts=2 sw=2 et:
