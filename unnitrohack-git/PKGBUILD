pkgname=unnitrohack-git
_pkgname=UnNitroHack
pkgver=20130212
pkgrel=1
pkgdesc="Combines UnNetHack and NitroHack with some changes and bug fixes."
arch=('i686' 'x86_64')
url="https://github.com/tung/NitroHack.git"
license=('custom')
depends=('jansson')
makedepends=('cmake' 'postgresql-libs' 'git')
checkdepends=()
optdepends=('postgresql-libs: to use nitrohack server')
conflicts=('nitrohack', 'nitrohack-git')

_gitroot=https://github.com/tung/NitroHack.git
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

  sed -i 's/ncursesw\///g' nitrohack/include/nhcurses.h
  cmake -DLIBDIR=/usr/lib/nitrohack -DDATADIR=/var/games/nitrohack -DBINDIR=/usr/lib/nitrohack -DSHELLDIR=/usr/bin .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  chmod 775 "$pkgdir/var/games/nitrohack"
  install -Dm644 ./libnitrohack/dat/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
