# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=libsocialweb-git
pkgver=20110218
pkgrel=1
pkgdesc="A personal social data server"
arch=('i686' 'x86_64')
url="http://www.gtk.org/"
license=('GPL2')
depends=('libsoup-gnome' 'librest' 'json-glib')
makedepends=('git' 'gtk-doc' 'intltool')
provides=('libsocialweb')
conflicts=('libsocialweb')
options=('!libtool')
source=('python2-path.patch')
md5sums=('a433129851307c7dd91bc07787669b48')

_gitroot="git://git.gnome.org/libsocialweb"
_gitname="libsocialweb"

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

  patch -Np0 -i ${srcdir}/python2-path.patch

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/libsocialweb \
    --enable-all-services=yes \
    --with-online=always
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  make DESTDIR="${pkgdir}" install
} 
