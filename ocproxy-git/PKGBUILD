# Maintainer: Paul Burton <paulburton89@gmail.com>
pkgname=ocproxy-git
pkgver=20140524
pkgrel=1
pkgdesc="user-level SOCKS & port forwarding proxy for OpenConnect"
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/ocproxy.git"
license=('BSD')
depends=('libevent')
makedepends=('git')

_gitroot=git://repo.or.cz/ocproxy.git
_gitname=ocproxy

prepare() {
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
}

build() {
  cd "$srcdir/$_gitname-build"

  make -C contrib/ports/unix/proj/ocproxy
}

package() {
  cd "$srcdir/$_gitname-build"

  make DESTDIR="$pkgdir/" install

  # extract BSD license from source header
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  head -n 25 contrib/ports/unix/proj/ocproxy/ocproxy.c | \
    tail -n 24 | sed 's/^ \* //' >"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
