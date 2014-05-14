# $Id: PKGBUILD 195379 2013-09-30 10:51:17Z jgc $
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=lightsoff
pkgname=$_pkgname-git
pkgver=3.13.1.7.g8612952
pkgrel=1
_realver=3.13.1
pkgdesc="Turn off all the lights"
arch=('i686' 'x86_64')
license=('GPL')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'gtk3' 'librsvg' 'clutter-gtk')
makedepends=('intltool' 'itstool' 'gobject-introspection' 'git' 'yelp-tools' 'gnome-common')
conflicts=('gnome-games' 'lightsoff')
replaces=('gnome-games' 'lightsoff')
provides=("lightsoff=$_realver")
options=('!emptydirs' '!libtool')
install=lightsoff.install
url="https://wiki.gnome.org/Apps/Lightsoff"
groups=('gnome-extra')
source=('git://git.gnome.org/lightsoff')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe | sed 's/^v//;s/-/./g;s/_/./g;'
}

prepare() {
  cd "$srcdir/$_pkgname"
}

build() {
  cd "$srcdir/$_pkgname"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install
}
