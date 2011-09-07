# Contributor: lh <jason52lh@gmail.com>
pkgname=fcitx-googlepinyin-hg
pkgver=31
pkgrel=1
pkgdesc="Fcitx Wrapper for googlepinyin."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPLv2')
depends=('fcitx>=4.1.0' 'libgooglepinyin-hg')
makedepends=('mercurial' 'cmake' 'intltool')
provides=(fcitx-googlepinyin)
conflicts=('fcitx-googlepinyin')
source=()
md5sums=()

_hgroot=https://fcitx-googlepinyin.fcitx.googlecode.com/hg/
_hgrepo=fcitx-googlepinyin

build(){
  cd "$srcdir"

  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make DESTDIR=${pkgdir} install
}
