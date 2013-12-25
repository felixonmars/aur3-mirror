pkgname=libeasyfc
pkgver=0.13.0
pkgrel=1
pkgdesc="Easy configuration generator interface for fontconfig"
url="http://tagoh.bitbucket.org/libeasyfc/"

arch=('i686' 'x86_64')
license=('LGPLv3+')

depends=(fontconfig)
makedepends=(glib2 gobject-introspection libxml2 fontconfig harfbuzz gettext)

source=("https://bitbucket.org/tagoh/libeasyfc/downloads/libeasyfc-${pkgver}.tar.bz2")

md5sums=("d4a3cf747cb35a64ce6cf5e934879b43")

build() {
	cd "$srcdir"/libeasyfc*
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/libeasyfc*
	make DESTDIR="$pkgdir" install
}
