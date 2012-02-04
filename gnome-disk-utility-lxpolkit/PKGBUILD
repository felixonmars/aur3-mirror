# $Id: PKGBUILD 74333 2010-03-30 19:31:03Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=gnome-disk-utility-lxpolkit
_pkgname=gnome-disk-utility
pkgver=2.30.1
pkgrel=1
pkgdesc="GNOME libraries and applications for dealing with storage devices. Uses lxpolkit instead of gnome-keyring."
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.gnome.org"
depends=('dbus-glib>=0.82' 'lxpolkit-git' 'libunique>=1.1.6' 'udisks>=1.0.0' 'libnotify>=0.4.5' 'hicolor-icon-theme' 'avahi')
makedepends=('gnome-doc-utils>=0.20.0' 'intltool')
replaces=('gnome-mount')
conflicts=('gnome-mount' 'gnome-disk-utility')
provides=('gnome-disk-utility=2.30.1')
options=('!libtool' '!emptydirs' '!makeflags')
install=gnome-disk-utility.install
source=(http://ftp.gnome.org/pub/GNOME/sources/${_pkgname}/2.30/${_pkgname}-${pkgver}.tar.bz2)
sha256sums=('df9b336c780b5d77ceda54e96f7c37c67645f5e73d48754ba0a8efba7c1836d7')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --libexecdir=/usr/lib/gnome-disk-utility \
      --disable-scrollkeeper --disable-nautilus --disable-gtk-doc || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
