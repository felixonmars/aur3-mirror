pkgname=invertika-server-git
pkgver=20111226
pkgrel=1
pkgdesc="Server for Invertika (basically a version of manaserv)"
arch=('i686' 'x86_64')
url="http://invertika.org/"
license=('GPL2')
makedepends=('git' 'cmake')
depends=('libxml2' 'lua' 'physfs' 'sqlite3')
provides=('invertika-server')

_gitroot=git://github.com/Invertika/invertika.git
_gitname=invertika

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  cp -R "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD
  #
  cd semistable/server
  cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr"
  make
  make DESTDIR="$pkgdir/" install
}
