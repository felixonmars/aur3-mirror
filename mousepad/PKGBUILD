# Contributor:  swanson <webaake gmail com>
# Maintainer: Pablo Lezaeta <prflr88 gmail com>

pkgname=mousepad
pkgver=0.3.0
pkgrel=1
pkgdesc="A simple text editor for Xfce4"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL')
groups=(xfce4-goodies)
depends=('desktop-file-utils' 'gtk2' 'hicolor-icon-theme' 'libxfcegui4' 'gtksourceview2' 'exo' )
makedepends=('xfce4-dev-tools' 'pkgconfig>=0.9.0' )
optdepends=('libgnomeprintui: for printing support')
provides=('mousepad')
conflicts=('mousepad')
install=mousepad.install
source=('mousepad.tar.bz2::http://git.xfce.org/apps/mousepad/snapshot/$pkgname-$pkgver.tar.bz2')

build() {

	cd "${srcdir}/${pkgname}-${pkgver}"
	export "DESTDIR=$pkgdir"

	sh autogen.sh --prefix=/usr --disable-debug --enable-dbus
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	export "DESTDIR=$pkgdir"
	make install
}

md5sums=('2472edb77b36dfbbedd95f5f17f3acf0')
