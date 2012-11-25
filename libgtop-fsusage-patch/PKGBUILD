# $Id: PKGBUILD 136578 2011-08-30 12:54:40Z ibiru $
# Maintainer: Jan de Groot <jgc@archlinux.org>
# from emmanuelux : I add the patch from Cole Robinson <crobinso@redhat.com> see http://bugzilla-attachments.gnome.org/attachment.cgi?id=226183

pkgname=libgtop-fsusage-patch
pkgver=2.28.4
pkgrel=1
pkgdesc="A library that read information about processes and the running system"
arch=('i686' 'x86_64')
license=('LGPL')
conflicts=(libgtop)
provides=(libgtop)
depends=('glib2' 'libxau' 'texinfo')
makedepends=('intltool' 'gobject-introspection')
install=libgtop.install
source=(http://ftp.gnome.org/pub/gnome/sources/libgtop/2.28/libgtop-${pkgver}.tar.xz fsusage.patch)
options=('!libtool')
url="http://www.gnome.org/"
sha256sums=('b6619cfd1540267ee81d456d1a26c72c793261586f1b00a7b9a7a229d0abe1d8' '7a2b5e4c26eb74e831a143cdae8af7174a462d2e0a71d54a9fe381d3aabeb189')

build() {
  cd "${srcdir}/libgtop-${pkgver}"
  ./configure --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --with-libgtop-smp
  patch -p2 < ../../fsusage.patch
  make
}

package() {
  cd "${srcdir}/libgtop-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
