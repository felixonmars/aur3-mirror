# Maintainer: Markus Opitz <mastero23 at gmail dot com>

pkgname=vagalume-git
pkgver=20120312
pkgrel=1
pkgdesc="Client for Last.fm and compatible services"
arch=('i686' 'x86_64')
url="http://vagalume.igalia.com/"
license=('GPL')
depends=('curl' 'dbus-glib' 'desktop-file-utils' 'gstreamer0.10-base' 'gtk2' 'hicolor-icon-theme'
         'libnotify' 'libproxy')
makedepends=('git')
provides=('vagalume')
conflicts=('vagalume')
install=vagalume-git.install

_gitroot="git://gitorious.org/vagalume/vagalume.git"
_gitname="vagalume"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="$pkgdir/" install
}
