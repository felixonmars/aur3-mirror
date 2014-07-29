# Maintainer: Ismael Carnales <icarnales@gmail.com>
# Contributor:  TDY <tdy@gmx.com>
# Contributor: Michael S. Walker <barrucadu@localhost>
 
pkgname=libqxt-git
pkgver=0.7.r2122.3e7424f
pkgrel=1
pkgdesc="provides a suite of cross-platform utility classes to add functionality not readily available in the Qt toolkit (git version)"
arch=('i686' , 'x86_64')
url="http://www.libqxt.org"
license=('CPL')
depends=('qt4' 'openssl' 'db' 'avahi')
makedepends=('git')
provides=('libqxt')
conflicts=('libqxt')
source=('git+https://bitbucket.org/libqxt/libqxt.git')
md5sums=('SKIP')
 
pkgver() {
  cd "$srcdir/libqxt"
  printf "0.7.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
prepare() {
  sed -e 's|-lXrandr|-lXrandr -lX11|g' -i "${srcdir}/libqxt/config.tests/xrandr/xrandr.pro"
}
 
build() {
  cd "$srcdir/libqxt"
  ./configure -qmake-bin "/usr/bin/qmake-qt4"
  make
}
 
package() {
  cd "${srcdir}/libqxt"
  make INSTALL_ROOT="${pkgdir}" install
}
