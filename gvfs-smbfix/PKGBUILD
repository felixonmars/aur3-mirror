_origname=gvfs
pkgname=gvfs-smbfix
pkgver=1.0.3
pkgrel=1
pkgdesc="Userspace virtual filesystem implemented as a pluggable module for gio. With patch to fix auth in browsing of smb shares."
arch=(i686 x86_64)
license=('LGPL')
depends=('libsoup>=2.24.2.1' 'libcdio>=0.80-3' 'fuse>=2.7.4' 'bluez-libs' 'smbclient>=3.2.4' 'libgphoto2>=2.4.3' 'gnome-keyring>=2.24.1' 'avahi>=0.6.23' 'libarchive>=2.5.5')
makedepends=('pkgconfig' 'intltool')
conflicts=('gvfs')
provides=('gvfs')
url="http://www.gnome.org"
install=gvfs.install
options=(!libtool)
source=(http://ftp.gnome.org/pub/gnome/sources/$_origname/1.0/$_origname-${pkgver}.tar.bz2 gvfs-smb-browse-auth-debug.patch)
md5sums=('a41e8b7d99e390cef8312f7ce5f312a5' '8c66a0172aeff2ec7334d91d71407e5f')

build() {
  cd "${srcdir}/$_origname-${pkgver}"
  patch -Np0 -i ${srcdir}/gvfs-smb-browse-auth-debug.patch || return 1
  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var --disable-static \
	      --libexecdir=/usr/lib/gvfs || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
