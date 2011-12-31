# Maintainer: Leif Warner <abimelech@gmail.com>
pkgname=weighttp-git
pkgver=20111227
pkgrel=1
pkgdesc="A lightweight and small benchmarking tool for webservers."
arch=('i686' 'x86_64')
url="http://redmine.lighttpd.net/projects/weighttp/wiki"
license=('custom')
depends=('libev')
makedepends=('git' 'python2')
provides=('weighttp')
conflicts=('weighttp')

_gitroot=git://git.lighttpd.net/weighttp
_gitname=weighttp

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
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd "$srcdir/$_gitname-build"
  DESTDIR="$pkgdir" python2 waf install
  install -D COPYING "$pkgdir/usr/share/licenses/$_gitname/COPYING"
}

# vim:set ts=2 sw=2 et:
