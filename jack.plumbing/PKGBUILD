# $Id$
# Maintainer: Hanspeter Portner <ventosus (at) airpost.net>

pkgname=jack.plumbing
pkgver=20040315
pkgrel=1
pkgdesc="A JACK Plumbing Daemon."
arch=('i686' 'x86_64')
url="http://rd.slavepianos.org/"
depends=('jack2')
license=('GPL2')
source=(
'http://ftp.de.debian.org/debian/pool/main/j/jack-tools/jack-tools_0.0.2.orig-sw04.tar.bz2'
'pthread.patch'
'deprecated.patch'
'warning.patch')
md5sums=(
'071dcdfae67bb97c287c86007e4fbaa2'
'ba165b8b7a52022de40349c227d8d8d7'
'cdbc031067d7bef1d117a87ec9d25820'
'9c2b21c15ce03315bf764366e65393fa'
)

build() { 
  cd "${srcdir}/sw-04"
	patch -p0 < "${srcdir}/pthread.patch"
	patch -p0 < "${srcdir}/deprecated.patch"
	patch -p0 < "${srcdir}/warning.patch"
	sh autogen.sh
	./configure --prefix=/usr
	make
}

package() {
  cd "${srcdir}/sw-04"
	make DESTDIR=${pkgdir} install
}
