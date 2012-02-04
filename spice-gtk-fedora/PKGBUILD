pkgname=spice-gtk-fedora
pkgver=0.4
pkgrel=1
pkgdesc="Spice-GTK is a set of GObject and Gtk objects for connecting to Spice servers."
arch=('i686')
url="http://freshmeat.net/projects/spice-gtk"
license=('LGPL')
depends=('gtk2' 'gobject-introspection' 'openssl')
provides=('spice-gtk')
makedepends=('rpmextract')
source=('ftp://fr2.rpmfind.net/linux/fedora/updates/testing/14/i386/spice-gtk-0.4-1.fc14.i686.rpm'
'ftp://fr2.rpmfind.net/linux/fedora/updates/testing/14/i386/spice-gtk-python-0.4-1.fc14.i686.rpm')
md5sums=('da4ba8f05aa90c09622271178de8d761'
	 '30e032beac13874a95af7b7273d8b89b')

build() {
  cd ${srcdir}
  rpmextract.sh spice-gtk-0.4-1.fc14.i686.rpm
  rpmextract.sh spice-gtk-python-0.4-1.fc14.i686.rpm
}

package() {
  cp -a usr ${pkgdir}
  cd ${pkgdir}/usr/lib
  ln -s libssl.so.1.0.0 libssl.so.10
  ln -s libcrypto.so.1.0.0 libcrypto.so.10
}


