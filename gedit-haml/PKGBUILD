# Contributor: pumbur <pumbur@ya.ru>

pkgname=gedit-haml
pkgver=1
pkgrel=1
pkgdesc="Haml Syntax Highlighting for gedit"
arch=('any')
url="http://blog.ardekantur.com/2008/03/haml-syntax-highlighting-for-gedit/"
license=('custom')
depends=('gtksourceview2')
source=(http://ardekantur.com/misc/gedit-haml/x-haml.xml http://ardekantur.com/misc/gedit-haml/haml.lang)
md5sums=('6e8c8784cf875aec9e2b3411bdc5c567' '8b0e26cb77bf99dc98a8a4bb93a09957')

build() {
	mkdir -p $pkgdir/usr/share/gtksourceview-2.0/language-specs
	cp $srcdir/* $pkgdir/usr/share/gtksourceview-2.0/language-specs
}


