# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Daniel Chesters <daniel.chesters@gmail.com>
pkgname=nitrohack-git
_pkgname=NitroHack
pkgver=20120527
pkgrel=1
pkgdesc="A single player dungeon exploration game (Nethack fork)"
arch=('i686' 'x86_64')
url="http://www.nitrohack.org/"
license=('custom')
depends=('jansson')
makedepends=('cmake' 'postgresql-libs' 'git')
checkdepends=()
optdepends=('postgresql-libs: to use nitrohack server')
conflicts=('nitrohack')
source=('ncurses.patch')

_gitroot=https://github.com/DanielT/NitroHack.git
_gitname=nitrohack


build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

  patch -p1 <../ncurses.patch
  cmake -DLIBDIR=/usr/lib/nitrohack -DDATADIR=/usr/share/nitrohack -DBINDIR=/usr/lib/nitrohack -DSHELLDIR=/usr/bin .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ./libnitrohack/dat/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
md5sums=('3c245958986fc796c81b09aaedd9ee56')
md5sums=('d46e63a79a0df4d5ea38de7a1a40264b')
