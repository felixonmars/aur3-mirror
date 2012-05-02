# Contributor: Nathan Hulse <nat.hulse@gmail.com>

_getthis=gvfs
pkgname=gvfs-obexftp-lite
pkgver=1.13.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="ObexFTP (bluetooth) backend for gvfs"
provides=('gvfs-obexftp')
conflicts=('gvfs-obexftp')
depends=("gvfs-lite=${pkgver}" 'dbus-glib>=0.86' 'bluez>=4.77' 'obex-data-server')
install=gvfs-module.install
license=('LGPL')
makedepends=('fuse>=2.8.4' 'bluez>=4.77' 'smbclient>=3.5.5' 'pkgconfig' 'intltool')
url="http://www.gnome.org"
options=(!libtool)
source=(http://ftp.gnome.org/pub/gnome/sources/${_getthis}/1.13/${_getthis}-${pkgver}.tar.xz)
md5sums=('2af7c5a8eca4446d8b2ca19db6bb962c')
sha256sums=('e3260164f4c6ec0d0560e3a8e067b4ad4ea59e443241c0c340f13affc6dc1c52')

build() {
  cd "${srcdir}/${_getthis}-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/gvfs \
      --with-bash-completion-dir=/etc/bash_completion.d
  make
}

package() {

  cd "${srcdir}/${_getthis}-${pkgver}/daemon"
  install -m755 -d "${pkgdir}/usr/lib/gvfs"
  install -m755 -d "${pkgdir}/usr/share/gvfs/mounts"

  install -m755 .libs/gvfsd-obexftp "${pkgdir}/usr/lib/gvfs/"
  install -m644 obexftp.mount "${pkgdir}/usr/share/gvfs/mounts/"
}




