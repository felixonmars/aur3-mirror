# $Id: PKGBUILD 218329 2014-07-29 14:10:55Z jgc $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# Maintainer: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Arjan Timmerman <arjan@archlinux.org>
# Contributor: Wael Nasreddine <gandalf@siemens-mobiles.org>
# Contributor: Tor Krill <tor@krill.nu>
# Contributor: Will Rea <sillywilly@gmail.com>

pkgbase=network-manager-applet-gtk2-lite
_pkgbase=network-manager-applet
pkgname=(network-manager-applet libnm-gtk)
pkgver=0.9.10.0
pkgrel=2
pkgdesc="Applet for managing network connections with minimal depends and gtk2 build"
arch=(i686 x86_64)
provides=('network-manager-applet' 'libnm-gtk')
conflicts=('network-manager-applet' 'libnm-gtk')
license=(GPL2 LGPL2.1)
url="http://www.gnome.org/projects/NetworkManager/"
makedepends=(gconf gnome-keyring libnm-glib libsecret gtk2 gnome-icon-theme mobile-broadband-provider-info iso-codes
             libnotify libmm-glib intltool gobject-introspection)
source=(http://ftp.gnome.org/pub/GNOME/sources/$pkgname/0.9/$pkgname-$pkgver.tar.xz)
sha256sums=('f5c26c692f538dc0145dc7d46d3d390754fad73d0ff06861c074c61f3dc54eca')

prepare() {
  cd $_pkgbase-$pkgver
}

build() {
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var \
      --libexecdir=/usr/lib/networkmanager \
      --disable-static \
      --disable-maintainer-mode \
      --disable-migration \
      --with-modem-manager-1=no \
      --with-gtkver=2 \
      --enable-indicator=no \
      --enable-introspection=no

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_pkgbase-$pkgver
  make -k check
}

package_network-manager-applet() {
  depends=(libnm-gtk libmm-glib libnotify libsecret)
  install=network-manager-applet.install

  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C src/libnm-gtk uninstall
}

package_libnm-gtk() {
  pkgdesc="NetworkManager GUI library"
  depends=(libnm-glib gtk2 mobile-broadband-provider-info iso-codes)

  cd $_pkgbase-$pkgver
  make DESTDIR="$pkgdir" -C src/libnm-gtk install
}
