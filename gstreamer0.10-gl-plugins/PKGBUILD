# $Id: PKGBUILD 29463 2009-03-08 19:27:36Z jgc $
# Maintainer: Jose Antonio Santos Cadenas <santoscadenas@gmail.com>

pkgname=gstreamer0.10-gl-plugins
pkgver=0.10.3
pkgrel=1
pkgdesc="GStreamer Multimedia Framework plug-in and helper libraries for OpenGL integration (gst-plugins-gl)"
arch=('i686' 'x86_64')
license=('LGPL')
depends=("gstreamer0.10-base>=${pkgver}" "glew>=1.4.0")
makedepends=('autoconf' 'automake' 'gettext' 'libtool' 'pkgconfig')
replaces=('gstreamer0.10-gl')
conflicts=('gstreamer0.10-gl')
provides=("gstreamer0.10-gl=${pkgver}")
url="http://gstreamer.freedesktop.org/"
groups=('gstreamer0.10-plugins')
#options=(!libtool)
_relname=gst-plugins-gl
source=(${url}/src/${_relname}/${_relname}-${pkgver}.tar.bz2)
md5sums=('ac70ede13f79978d56eaed8abaa3c938')

build() {
	cd "${srcdir}/${_relname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
		--disable-static \
		--with-package-name="GStreamer OpenGL Plugins (Archlinux)" \
		--with-package-origin="http://www.archlinux.org/" || return 1

	make || return 1
	make DESTDIR="${pkgdir}" install
}
