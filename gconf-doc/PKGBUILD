# Contributor: Giuseppe Fuggiano <giuseppe.fuggiano@gmail.com>
pkgname=gconf-doc
pkgver=2.22.0
pkgrel=1
pkgdesc="Documentation for GConf to be used in devhelp"
arch=(i686 x86_64)
url="http://library.gnome.org/devel/gconf/stable/"
license=('GPL')
source=(ftp://ftp.gnome.org/pub/gnome/sources/GConf/2.22/GConf-${pkgver}.tar.bz2)
md5sums=('a56c043afeb1052abaf45407409b0331')

build () {
	# Create destination dir
	install -d ${startdir}/pkg/usr/share/devhelp/books/gconf

	# Install documentation to destination
	install -D -m 644 ${startdir}/src/GConf-${pkgver}/doc/gconf/html/* \
		${startdir}/pkg/usr/share/devhelp/books/gconf
}
