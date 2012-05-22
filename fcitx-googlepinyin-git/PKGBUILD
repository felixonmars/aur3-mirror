# Contributor: lh <jason52lh@gmail.com>
pkgname=fcitx-googlepinyin-git
pkgver=20120522
pkgrel=1
pkgdesc="Fcitx Wrapper for googlepinyin."
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx"
license=('GPLv2')
depends=('fcitx>=4.1.0' 'libgooglepinyin')
makedepends=('mercurial' 'cmake' 'intltool')
provides=(fcitx-googlepinyin)
conflicts=('fcitx-googlepinyin')
source=()
md5sums=()

_gitroot=git://github.com/fcitx/fcitx-googlepinyin/
_gitname=fcitx-googlepinyin

build(){
  cd "$srcdir"
  msg "Connecting to the GIT server...."

  if [[ -d $srcdir/$_gitname ]] ; then
    cd $_gitname
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  cd "$srcdir"

  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make DESTDIR=${pkgdir} install
}
