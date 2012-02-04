# Contributor: lh <jason52lh@gmail.com>

pkgname=fcitx-configtool-hg
pkgver=49
pkgrel=1
pkgdesc="Fcitx Config Tool"
url="http://code.google.com/p/fcitx"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'fcitx' 'libunique')
makedepends=('mercurial' 'intltool' 'cmake')
optdepends=()
options=('!libtool')
conflicts=('fcitx-config' 'fcitx-configtool')
provides=('fcitx-config' 'fcitx-configtool')
replaces=()
install=fcitx-configtool.install
source=()
md5sums=()

_hgroot=https://fcitx-config.fcitx.googlecode.com/hg/
_hgrepo=fcitx-configtool

build() {
  cd "$srcdir"

  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"
  
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}
package(){
  cd "$srcdir/$_hgrepo-build"
  make DESTDIR=${pkgdir} install
}
# vim:syntax=sh
