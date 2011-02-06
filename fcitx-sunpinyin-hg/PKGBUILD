# Contributor: lh <jason52lh@gmail.com>
pkgname=fcitx-sunpinyin-hg
pkgver=37
pkgrel=1
pkgdesc="Fcitx Wrapper for sunpinyin."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPL')
depends=('fcitx' 'sunpinyin')
makedepends=('mercurial' 'cmake' 'intltool')
provides=(fcitx-sunpinyin)
conflicts=('fcitx-sunpinyin')
source=()
md5sums=()

_hgroot=https://fcitx-sunpinyin.fcitx.googlecode.com/hg/
_hgrepo=fcitx-sunpinyin

build(){
  cd "$srcdir"

  msg "Starting make..."

  rm -rf "$srcdir/$_hgrepo-build"
  cp -rf "$srcdir/$_hgrepo" "$srcdir/$_hgrepo-build"
  cd "$srcdir/$_hgrepo-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make DESTDIR=${pkgdir} install
}