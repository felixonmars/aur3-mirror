# Maintainer: Adrián Pérez de Castro <aperez@igalia.com>
pkgname='openwebrtc-gst-plugins'
pkgver='0.3.0'
pkgrel='1'
arch=('x86_64' 'i686')
license=('custom')
description='OpenWebRTC specific GStreamer plugins'
url='https://github.com/EricssonResearch/openwebrtc-gst-plugins'
source=("${url}/archive/v${pkgver}.tar.gz")
depends=('gst-plugins-base-libs' 'sctp-refimpl-svn')
sha512sums=('0b287149489a85e4da1327e03412ceb0ccf731cb84798ebb7ba286ea541dd3ca1463b76f8982f1fe7a4ea5551053d12629fc96fa46b3402e8da985084dd87119')

prepare () {
	cd "${pkgname}-${pkgver}"
	./autogen.sh
}

build () {
	cd "${pkgname}-${pkgver}"
	./configure --prefix=/usr --enable-linux-plugins
	make
}

package () {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="${pkgdir}"
	install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
