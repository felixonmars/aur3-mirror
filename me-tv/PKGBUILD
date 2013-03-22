#Maintainer: Christoph Seitz <seitz.christoph@gmail.com>
#Previous Maintainer: jakob gruber <jakob.gruber@gmail.com>
#Contributor: gborzi
#Previous Contributor: Vinzenz Vietzke <vinz@archlinux.us>
#Previous Contributor: Heiko Baums <heiko@baums-on-web.de>
#Previous Contributor: Jeff Bailes <thepizzaking@gmail.com>

pkgname=me-tv
pkgver=1.4.0.12
pkgrel=3
epoch=1
pkgdesc="A digital television (DVB) viewer for GNOME."
arch=('i686' 'x86_64')
url="https://launchpad.net/me-tv"
license=('GPL')
depends=('gtkmm' 'gconfmm' 'libxml++' 'libunique' 'vlc' 'gstreamer0.10-base')
optdepends=('linuxtv-dvb-apps: dvb tools'
'w_scan: generation of channels.conf')
makedepends=('intltool' 'gnome-common')
install='me-tv.install'
source=("http://launchpad.net/${pkgname}/${pkgver:0:3}/${pkgver:0:5}/+download/${pkgname}-${pkgver}.tar.gz")
md5sums=('28c7fd5523fd6ea8f5de89b297eb1391')
options=('!emptydirs')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	
	# Missing unistd.h includes :| https://bugs.launchpad.net/me-tv/+bug/1020690
	for file in common/common.cc server/thread.cc; do
		sed -i '1 i\
			#include <unistd.h>' $file
	done
	
	#fix aclocale error 
	sed -i '/AM_PROG_CC_STDC/d' configure.ac
	
	NOCONFIGURE=1 ./autogen.sh
	./configure CXXFLAGS="$CXXFLAGS -D__KERNEL_STRICT_NAMES" --prefix=/usr

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	make -j1 GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="${pkgdir}" install

	install -m755 -d "${pkgdir}/usr/share/gconf/schemas"
	gconf-merge-schema "${pkgdir}/usr/share/gconf/schemas/${pkgname}.schemas" \
        --domain me-tv "${pkgdir}/usr/etc/gconf/schemas/${pkgname}.schemas"

	rm -rf "${pkgdir}/usr/etc/"
}

