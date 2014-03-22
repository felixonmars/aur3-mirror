# Maintainer: Martin Pöhlmann <martin.deimos@gmx.de>

pkgname=california
pkgver=0.1.0r96.8c02e41
pkgrel=1
pkgdesc="A new calendar application for GNOME 3. It's currently under heavy development."
arch=(i686 x86_64)
url="https://wiki.gnome.org/Apps/California"
license=('LGPL2.1')
depends=('evolution-data-server' 'libgee')
makedepends=('automake' 'make' 'vala' 'git' 'intltool' 'gnome-common')
provides=('california')
conflicts=('california')
install=california.install
source=('git://git.gnome.org/california')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/california"
	printf "0.1.0r%s.%s" "$(git rev-list --count master)" "$(git rev-parse --short master)"
}

build() {
	cd "$srcdir/california"
	sed -i 's#californiadocdir = ${prefix}#californiadocdir = ${datadir}#g' Makefile.am
	./autogen.sh
	./configure \
		--prefix=/usr
	make
}

package() {
	cd "$srcdir/california"
	make install DESTDIR="$pkgdir"
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
