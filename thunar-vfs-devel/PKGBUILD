# Maintainer: Xavier Devlamynck <magicrhesus@ouranos.be>
# Contributor: AndyRTR <andyrtr@archlinux.org>

pkgname=thunar-vfs-devel
pkgver=1.2.0
pkgrel=1
pkgdesc="Virtual filesystem shipped with the thunar 1.0 and earlier releases"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://www.xfce.org/"
depends=('exo-devel' 'startup-notification' 'hal' 'fam')
makedepends=('intltool')
options=('!libtool')
source=(http://archive.xfce.org/src/xfce/thunar-vfs/1.2/thunar-vfs-$pkgver.tar.bz2)
md5sums=('1fbc55af8ed98174f5c3c7f8daec10cc')

build() {
  cd ${srcdir}/thunar-vfs-${pkgver}
  ./configure --prefix=/usr \
	--sysconfdir=/etc \
	--libexecdir=/usr/lib \
	--localstatedir=/var \
	--disable-static \
	--enable-startup-notification \
	--enable-dbus \
	--with-volume-manager=hal \
	--disable-debug
  make
}

package() {
  cd ${srcdir}/thunar-vfs-${pkgver}
  make DESTDIR=${pkgdir} install
}
