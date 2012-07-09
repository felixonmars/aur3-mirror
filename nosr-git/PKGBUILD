# Contributor: Dave Reisner <d@falconindy.com>

pkgname=nosr-git
pkgver=20120709
pkgrel=1
pkgdesc="a pacman .files metadata explorer"
arch=('i686' 'x86_64')
url="http://github.com/falconindy/nosr"
license=('MIT')
depends=('libarchive' 'curl' 'pcre' 'pacman')
makedepends=('git' 'perl')
conflicts=('nosr')
provides=('nosr')
install=nosr.install

_gitroot="git://github.com/falconindy/nosr.git"
_gitname="nosr"

build() {
  msg "Connecting to GIT server...."

  if [[ -d $_gitname ]] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  make
}

package() {
  make -C "$srcdir/$_gitname-build" PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
