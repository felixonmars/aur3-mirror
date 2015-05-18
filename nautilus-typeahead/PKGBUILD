# Maintainer: Joschka Thurner <mail@joschkathurner.de>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=nautilus-typeahead
pkgver=3.16.2
pkgrel=2
pkgdesc="GNOME file manager with interactive-search patch from Ubuntu"
arch=(i686 x86_64)
license=(GPL)
depends=(libexif gnome-desktop exempi gvfs desktop-file-utils gnome-icon-theme dconf
         libtracker-sparql libnotify nautilus-sendto)
makedepends=(intltool gobject-introspection python python2)
conflicts=('nautilus' 'libnautilus-extension')
provides=('nautilus=3.16.2' 'libnautilus-extension=3.16.2')
install=nautilus-typeahead.install
url="http://www.gnome.org"
source=(http://download.gnome.org/sources/nautilus/${pkgver%.*}/nautilus-$pkgver.tar.xz
        interactive_search.patch)
sha256sums=('3e7ecdda3a47b6ad03098270940aa506782866fa3602d91e711d99f96741478f'
            '7c7d82908baf28d2d57471b9fbb2131d987869eb5f8f3d5890c48ab244102154')

prepare() {

  # bug: https://bugs.launchpad.net/ubuntu/+source/nautilus/+bug/1164016
  # source: https://bazaar.launchpad.net/~ubuntu-branches/ubuntu/trusty/nautilus/trusty/files/head:/debian/patches/
  cd nautilus-$pkgver
  patch -Np1 -i ../interactive_search.patch
}

build() {
  cd nautilus-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nautilus \
      --disable-update-mimedb \
      --disable-schemas-compile
  make
}


package() {
  cd nautilus-$pkgver
  make DESTDIR="$pkgdir" install
}
