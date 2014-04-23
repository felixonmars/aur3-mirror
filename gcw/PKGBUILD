pkgname="gcw"
pkgver=0.9.3
pkgrel=1
pkgdesc="Simple GTK text editor."
arch=('i686' 'x86_64')
url="http://pronou.net/code/gcw/"
license=('WTFPL')
depends=('gtksourceview2')
makedepends=('intltool')
conflicts=('gcw')
source=(${url}gcw-${pkgver}.tar.xz)
sha256sums=(fa0980a60d5e26b28f6350e7b2255ab4f5ec74e7e52ecfabd4d16602e0116cfa)
#install=('gcw.install')
build() {
	cd "${pkgname}-${pkgver}"

	./configure --prefix=/usr --with-gtk=2.0

	make
}

package() {
	cd "${pkgname}-${pkgver}"

	make DESTDIR="${pkgdir}" install
}
