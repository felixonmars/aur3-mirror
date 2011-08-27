# Contributor: Haoyang Yuan <latteye@gmail.com>
pkgname=gstreamer-doc
pkgver=0.10.10
pkgrel=1
pkgdesc="Documentation for gstreamer to be used in devhelp"
arch=(i686 x86_64)
url="http://gstreamer.freedesktop.org/"
license=('custom')
source=(http://arch.latteye.com/gstreamer/gstreamer-${pkgver}.tar.bz2)
md5sums=('68b50e94513fa5a0f21ab3da4a4499b7')

build () {
	# Create destination dirs
	install -d ${startdir}/pkg/usr/share/devhelp/books/gstreamer-0.10

	# Install documentation to destination
  install -m 644 \
    ${startdir}/src/gstreamer-${pkgver}/* \
    ${startdir}/pkg/usr/share/devhelp/books/gstreamer-0.10
 
}

# vim:set ts=2 sw=2 et:
