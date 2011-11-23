# Maintainer: Hanspeter Portner <agenthp@users.sf.net>
pkgname=lua-ev-git
pkgver=20111123
pkgrel=1
pkgdesc="Lua integration with libev"
arch=(i686 x86_64)
url="https://github.com/psychon/lua-ev"
license=('MIT')
depends=('libev' 'lua')
makedepends=('git' 'cmake')
source=()
md5sums=() #generate with 'makepkg -g'

_gitroot="https://github.com/psychon/lua-ev.git"
_gitname="lua-ev"

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
  cmake -DINSTALL_CMOD=/usr/lib/lua/5.1 -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
  head -n 26 README > "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
