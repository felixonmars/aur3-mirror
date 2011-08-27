# Contributor: Giuseppe Fuggiano <giuseppe.fuggiano@gmail.com>
pkgname=libglade-doc
pkgver=2.6.2
pkgrel=1
pkgdesc="Documentation for libglade to be used in devhelp"
arch=(i686 x86_64)
url="http://library.gnome.org/devel/gconf/stable/"
license=('GPL')
source=(ftp://ftp.gnome.org/pub/gnome/sources/libglade/2.6/libglade-${pkgver}.tar.bz2)
md5sums=('da4f9d1c6cd1337f6ef5e2db768d8557')

build () {
	# Create destination dir
	install -d ${startdir}/pkg/usr/share/devhelp/books/libglade

	# Install documentation to destination
	install -D -m 644 ${startdir}/src/libglade-${pkgver}/doc/html/* \
		${startdir}/pkg/usr/share/devhelp/books/libglade
}
