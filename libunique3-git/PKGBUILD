# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=libunique3-git
pkgver=20111016
pkgrel=1
pkgdesc="GTK+ 3 version of libunique"
arch=(i686 x86_64)
license=('LGPL')
url="http://live.gnome.org/LibUnique"
depends=('dbus' 'glib' 'dbus-glib' 'gtk3')
makedepends=('gnome-common' 'gtk-doc')
replaces=('libunique3')
provides=('libunique3=2.91.5')
conflicts=('libunique3')
source=()

_gitroot="git://git.gnome.org/unique"
_gitname="unique"

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

  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var
  make
  make DESTDIR="$pkgdir" install
}
