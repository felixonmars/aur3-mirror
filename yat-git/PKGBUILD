# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=yat-git
pkgver=0.20140304.9354b07
pkgrel=1
pkgdesc="VT100 emulation screen written in C++ and QML"
arch=('i686' 'x86_64')
url="https://github.com/jorgen/yat"
license=('MIT')
depends=('qt5-base' 'qt5-declarative')
makedepends=('git' 'gdb' 'qtchooser')
options=('!libtool' 'staticlibs' 'debug')
source=(yat::git://github.com/jorgen/yat.git#branch=master)
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/yat

  # yat don't have any tag yet, we use our imagination here
  git describe --always | sed 's|-|.|g'

  #rev=$(git describe --always)
  #date=$(date "+%Y%m%d")
  #echo "0.${date}.${rev}"
}

build() {
  export QT_SELECT=5

  cd yat
  ./configure -nomake tests
  make
}

package() {
  cd yat
  make INSTALL_ROOT="${pkgdir}" install
}
