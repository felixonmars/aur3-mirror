# Contributor: gucong <gucong43216@gmail.com>

pkgname=hoichess-git
pkgver=20110918
pkgrel=1
pkgdesc="Xboard compatible chess engine and xiangqi (Chinese chess) engine"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.hoicher.de/hoichess"
depends=()

_gitroot="https://github.com/dancor/hoichess.git"
_gitname="hoichess"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull master
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make || return 1
}
package() {
  cd "$srcdir/$_gitname-build"
  install -Dm 644 hoichess.6 "$pkgdir/usr/share/man/man6/hoichess.6"
  cd src/.build-unix
  install -Dm 755 hoichess "$pkgdir/usr/bin/hoichess"
  install -Dm 755 hoixiangqi "$pkgdir/usr/bin/hoixiangqi"

}