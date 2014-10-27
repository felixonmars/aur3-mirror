# Maintainer: kontakt.zuf#gmail.com # https://github.com/zuf/aur-packages
# Contributor: reMiND <detanator at gmail dot com>

pkgname=whdd-git
pkgver=r270.1b6bbe1
pkgrel=3
epoch=1
pkgdesc="Diagnostic and recovery tool for block devices (near to replace MHDD for Linux)"
arch=('i686' 'x86_64')
url="http://whdd.org"
license=('GPL')
depends=('ncurses' 'smartmontools' 'dialog')
makedepends=('git' 'cmake')
provides=('whdd')
conflicts=('whdd')
source=("$pkgname"::'git://github.com/krieger-od/whdd.git#branch=master')
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
# -DCLI=ON for whdd-cli. Utility is purposed for development
#          and debugging whdd
# -DSTATIC=ON for static build. Workaround build if troubles
  cmake . -DCMAKE_INSTALL_PREFIX=/usr/
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
