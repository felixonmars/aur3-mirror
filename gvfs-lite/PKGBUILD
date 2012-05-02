# Contributor: Nathan Hulse <nat.hulse@gmail.com>

_getthis=gvfs
pkgname=gvfs-lite
pkgver=1.13.0
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="Userspace virtual filesystem implemented as a pluggable module for gio"
provides=('gvfs')
conflicts=('gvfs')
optdepends=('gvfs-smb-lite: SMB/CIFS (Windows client) support'
            'gvfs-obexftp-lite: ObexFTP (bluetooth) support')
install=gvfs.install
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
  cd "${srcdir}/${_getthis}-${pkgver}"
  sed -e 's/^am__append_3/#am__append_3/' \
      -e 's/^am__append_4/#am__append_4/' \
      -i monitor/Makefile
  make DESTDIR="${pkgdir}" install
  cd "${pkgdir}"
  rm -f usr/lib/gvfs/gvfsd-{smb,smb-browse,afc,gphoto2,obexftp}
  rm -f usr/share/gvfs/mounts/{smb,smb-browse,afc,gphoto2,obexftp}.mount
}







