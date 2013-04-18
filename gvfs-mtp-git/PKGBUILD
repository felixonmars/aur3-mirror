# $Id: PKGBUILD 164365 2012-07-31 19:42:58Z eric $
# Original Package: Jan de Groot <jgc@archlinux.org>
# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>

_pkgname=gvfs
pkgname=$_pkgname-mtp-git
conflicts=('gvfs' 'gvfs-smb' 'gvfs-afc' 'gvfs-afp' 'gvfs-gphoto2' 'gvfs-obexftp' 'libmtp-gvfs-git' 'gvfs-mtp')
provides=('gvfs=1.16.0' 'gvfs-smb' 'gvfs-afc' 'gvfs-afp' 'gvfs-gphoto2' 'gvfs-obexftp' 'gvfs-mtp')
pkgver=1.16.0.33.g05ebb30
pkgrel=1
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('avahi' 'bluez' 'dbus-glib' 'fuse' 'intltool' 'libarchive' 'libcdio' 'libgphoto2' 'libimobiledevice' 'libsoup-gnome' 'smbclient' 'udisks2' 'gtk-doc')
url="http://www.gnome.org"
options=(!libtool)
_gitname=$_pkgname

pkgdesc="Userspace virtual filesystem implemented as a pluggable module for gio. With native MTP support."
depends=('avahi' 'dconf' 'fuse' 'libarchive' 'libcdio' 'libsoup-gnome' 'udisks2'  'smbclient' 'libgnome-keyring' 'libimobiledevice' 'dbus-core' 'libgphoto2' 'udev' 'dbus-glib' 'bluez' 'obex-data-server' 'libmtp')

install=gvfs.install

source="git://git.gnome.org/$_pkgname"
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gvfs \
      --with-bash-completion-dir=/usr/share/bash-completion/completions
  make
}

package() {
  cd $_gitname
  make DESTDIR="$pkgdir" install
}
