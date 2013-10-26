# Maintainer: Angus McInnes <angus@amcinnes.info>
pkgname=v4l-utils-git
pkgver=v4l.utils.1.0.0.58.g99389de
pkgrel=1
pkgdesc="Userspace tools and conversion library for Video 4 Linux"
arch=('i686' 'x86_64')
url="http://freshmeat.net/projects/libv4l"
provides=("libv4l=$pkgver" 'v4l-utils')
replaces=('libv4l')
conflicts=('libv4l' 'v4l-utils')
backup=(etc/rc_maps.cfg)
license=('LGPL')
makedepends=('qt4' 'autoconf')
optdepends=('qt4')
depends=('glibc' 'gcc-libs' 'sysfsutils' 'libjpeg-turbo')
source=("$pkgname"::'git://git.linuxtv.org/v4l-utils.git')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	# Use the tag of the last commit
	local ver="$(git describe --long)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "${srcdir}/${pkgname}"
	autoreconf -vfi
	./configure --prefix=/usr --sysconfdir=/etc --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	MAKEFLAGS="-j1" make install DESTDIR="${pkgdir}/"
	rm "${pkgdir}/usr/bin/ivtv-ctl"
}
