# Maintainer: Serge Ziryukin <ftrvxmtrx@gmail.com>

pkgname=ocamljit2-git
pkgver=20101116
pkgrel=2
pkgdesc="Just-In-Time compiler for Objective Caml"
arch=('i686' 'x86_64')
url="http://gitorious.org/ocamljit2"
license=('LGPL2' 'custom: QPL-1.0')
depends=('gdbm')
makedepends=('git' 'tk' 'ncurses>=5.6-7' 'libx11')
optdepends=('ncurses: advanced ncurses features' 'tk: advanced tk features')
options=('!makeflags' '!emptydirs')

_gitroot="git://gitorious.org/ocamljit2/ocamljit2.git"
_gitname="ocamljit2"

build() {
  cd "$srcdir"

  msg "Connecting to GIT server..."

  if [ -d "$srcdir/$_gitname" ]; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cp -rf "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # configure
  ./configure -prefix /usr/ocamljit2 || return 1

  # build
  make world opt || return 1

  # install
  make PREFIX="$pkgdir/usr/ocamljit2" MANDIR="$pkgdir/usr/ocamljit2/share/man" install || return 1

  # strip unneeded
  find "${startdir}/pkg/usr/ocamljit2/lib" -type f -name '*.so.*' -exec strip --strip-unneeded '{}' \;

  # license
  install -D -m 644 "$srcdir/$_gitname-build/LICENSE" "$startdir/pkg/usr/share/licenses/ocamljit2/LICENSE"
}
