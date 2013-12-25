pkgname=fonts-tweak-tool
pkgver=0.3.2
pkgrel=2
pkgdesc="Tool for customizing fonts per language"
url="https://bitbucket.org/tagoh/fonts-tweak-tool/"

arch=('i686' 'x86_64')
license=('LGPLv3+')

depends=(libeasyfc pygobject-devel gtk3 hicolor-icon-theme)
makedepends=(desktop-file-utils intltool python gobject-introspection  glib2)

source=("https://bitbucket.org/tagoh/fonts-tweak-tool/downloads/fonts-tweak-tool-${pkgver}.tar.bz2")

md5sums=("8da2567522fe616b85a9e0b225ced55b")

build() {
	cd "$srcdir"/fonts-tweak-tool-*
	./configure --prefix=/usr
	make
}

package() {
	cd "$srcdir"/fonts-tweak-tool-*
	make DESTDIR="$pkgdir" install
}
