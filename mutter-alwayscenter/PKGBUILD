# Maintainer: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Maintainer: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>
# Contributor: Felipe Morales <hel.sheep@gmail.com>
# See https://bugzilla.gnome.org/show_bug.cgi?id=646629

pkgname=mutter-alwayscenter
pkgver=3.6.2
pkgrel=1
pkgdesc="A window manager for GNOME, patched to always center new windows"
arch=(i686 x86_64)
license=('GPL')
depends=('clutter' 'dconf' 'gobject-introspection' 'gsettings-desktop-schemas' 'libcanberra' 'startup-notification' 'zenity')
makedepends=('intltool' 'gnome-doc-utils')
provides=('mutter')
conflicts=('mutter')
url="http://www.gnome.org"
groups=('gnome')
options=('!libtool' '!emptydirs')
install=mutter.install
source=(http://ftp.gnome.org/pub/gnome/sources/mutter/3.6/mutter-$pkgver.tar.xz
        0001-always-center.patch)
sha256sums=('924f47681c972c3e8da610608c6aef35e61f52b338b5690e5721ed7ef8c2befc'
            '104a5652fd8fee70284dacdd5d505c218c7015607d7a11de46d1e86a81a64df6')

build() {
  cp 0001-always-center.patch "mutter-$pkgver/"
  cd "mutter-$pkgver"
  patch -p1 < 0001-always-center.patch
  ./configure --prefix=/usr --sysconfdir=/etc \
      --libexecdir=/usr/lib/mutter \
      --localstatedir=/var --disable-static \
      --disable-schemas-compile
  make
}

package() {
  cd "mutter-$pkgver"
  make DESTDIR="$pkgdir" install
}
