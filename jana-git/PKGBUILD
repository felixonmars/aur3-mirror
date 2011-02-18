# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Alex Anthony <alex.anthony28991@googlemail.com>

pkgname=jana-git
pkgver=200110218
pkgrel=1
pkgdesc="An interface library for time-related personal information management related data"
arch=('i686' 'x86_64')
url="http://www.gnome.org"
license=('GPL')
depends=('gnome-common' 'gtk2' 'evolution-data-server')
makedepends=('git' 'intltool' 'gtk-doc')
provides=('jana')
conflicts=('jana')

_gitroot="git://git.gnome.org/jana"
_gitname="jana"

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

  ./autogen.sh
  ./configure --prefix=/usr \
    --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/$_gitname-build"
  make DESTDIR=$pkgdir install
}
