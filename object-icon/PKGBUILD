# Maintainer: perlawk

pkgname=object-icon
_pkgname=objecticon
pkgver=2.11
pkgrel=2
pkgdesc="Object Icon is an object-oriented extension of the Icon programming language."
url="http://code.google.com/p/objecticon/"
arch=('x86_64' 'i686')
license=('MIT')
depends=('cairo' 'expat' 'gdk-pixbuf2' 'graphite' 'harfbuzz' 'libcroco' 'libdrm' 'libffi' 'libpng' 'librsvg' 'libxml2' 'mesa' 'pango' 'pcre' 'pixman' 'zlib') 
optdepends=()
makedepends=('svn')
conflicts=()
replaces=()
backup=()
install=

prepare() {
	cd "$srcdir"
	if [ ! -e $_pkgname ]; then
		svn checkout http://objecticon.googlecode.com/svn/trunk/ objecticon
	fi
}

build() {
  cd "${srcdir}/${_pkgname}"
	autoconf
	./configure --prefix=/usr
  make -j4
	sed -e "s!prefix=/usr!prefix=${pkgdir}/usr!g" Makefile > mf
}
 
package() {
  cd "${srcdir}/${_pkgname}"
  make -f mf install 
}
