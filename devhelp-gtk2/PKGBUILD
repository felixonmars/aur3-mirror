# Maintainer: Yosef Or Boczko <yoseforb@gnome.org>

_pkgname=devhelp
pkgname=${_pkgname}-gtk2
pkgver=2.32.0
pkgrel=0
pkgdesc="API documentation browser for GNOME (gtk2 version)"
arch=(i686 x86_64)
license=('GPL')
url="http://live.gnome.org/devhelp/"
depends=('webkitgtk2' 'gtk2' 'libunique' 'libwnck')
makedepends=('intltool' 'python2')
options=('!libtool' '!emptydirs')
conflicts=('devhelp')
replaces=('devhelp')
provides=('devhelp')
source=('http://ftp.acc.umu.se/pub/GNOME/sources/devhelp/2.32/devhelp-2.32.0.tar.gz')
sha256sums=('3d43e7b4dfa3bd035dd8cb84e30e7ae4f41c11b516ac0b398dc9d2b3bc219d09')

build() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	./configure --prefix=/usr
}

package() {
	cd "$srcdir/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
