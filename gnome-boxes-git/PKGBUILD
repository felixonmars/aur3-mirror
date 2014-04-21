# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Stefano Facchini <stefano.facchini@gmail.com>

_pkgname=gnome-boxes
pkgname=$_pkgname-git
pkgver=3.11.91.r104.gab6cc04
pkgrel=1
pkgdesc="Simple GNOME 3 application to access remote or virtual systems (git version)"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/Apps/Boxes"
license=('LGPL')
depends=('clutter-gtk' 'gtk-vnc' 'libosinfo' 'libsoup' 'libvirt-glib' 'spice-gtk3'
         'libtracker-sparql' 'qemu' 'cdrkit' 'libcdio' 'mtools' 'dconf'
         'gnome-icon-theme' 'gnome-themes-standard')
makedepends=('git' 'gobject-introspection' 'intltool' 'yelp-tools' 'spice-protocol' 'vala')
conflicts=("$_pkgname")
provides=("$_pkgname")
install=$_pkgname.install
source=(git://git.gnome.org/$_pkgname
        git://git.gnome.org/libgd)
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
               --disable-static --disable-schemas-compile --enable-smartcard
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
