# Maintainer : sebikul <sebikul@gmail.com>
# Contributor : Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=geary
pkgver=0.3.1
pkgrel=2
pkgdesc="A new lightweight, easy-to-use, feature-rich email client"
arch=('i686' 'x86_64')
url="http://redmine.yorba.org/projects/geary"
license=('GPL')
depends=('gmime' 'libunique3' 'webkitgtk3' 'libgnome-keyring' 'libgee06' \
	  'dconf' 'hicolor-icon-theme' 'desktop-file-utils' 'libcanberra' \
	  'libnotify' 'gobject-introspection')
makedepends=('vala>=0.17.4' 'cmake' 'intltool')
install=geary.install
conflicts=('geary-git')

source=(http://yorba.org/download/geary/stable/$pkgname-$pkgver.tar.xz)
md5sums=('aeb7c65926cbe47d19851ecb72dbf6cc')

build() {

	cd ${srcdir}/${pkgname}-${pkgver}
	
	./configure --prefix=/usr
	
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make DESTDIR="$pkgdir" install
	install -Dm644 icons/128x128/geary.svg "$pkgdir/usr/share/pixmaps/geary.svg"
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}