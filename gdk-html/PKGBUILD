# Maintainer: Marco Rocco <mr85mr@gmail.com>

pkgname=gdk-html
pkgver=2.15
pkgrel=3
pkgdesc="Documentation for GDK to be used in devhelp"
arch=('i686' 'x86_64')
license=('GPL')
url="http://library.gnome.org/devel/gdk/"
source=(http://library.gnome.org/devel/gdk/gdk-html-${pkgver}.${pkgrel}.tar.gz)

md5sums=('9c04fc3b81b868129585362fc9822ab8')

build () {
	# Create destination dir
	install -d ${startdir}/pkg/usr/share/gtk-doc/html/gdk

	# Install documentation to destination
	install -D -m 644 ${startdir}/src/gdk-html-${pkgver}.${pkgrel}/* \
    ${startdir}/pkg/usr/share/gtk-doc/html/gdk
}

