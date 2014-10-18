# Maintainer: William Alexander <accountsonly at openmailbox dot org>

pkgname=weston-rdp
pkgver=1.6.0
pkgrel=1
pkgdesc='Reference implementation of a Wayland compositor'
arch=('i686' 'x86_64')
url='http://wayland.freedesktop.org'
license=('MIT')
depends=('libxkbcommon' 'libunwind' 'poppler-glib' 'mtdev' 'libxcursor' 'glu' 'pango' 'colord' 'libinput' 'freerdp')
provides=('weston')
conflicts=('weston')
source=("http://wayland.freedesktop.org/releases/weston-$pkgver.tar.xz")
sha1sums=('f3c801f0610b605cda45a017b475c10f2d3b7dbb')

build() {
	cd weston-$pkgver
	./configure \
		--prefix=/usr \
		--libexecdir=/usr/lib/weston \
		--with-cairo=gl \
		--enable-demo-clients-install \
		--enable-rdp-compositor
	make
}

package() {
	cd weston-$pkgver
	make DESTDIR="$pkgdir" install
	# license
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/weston/COPYING"
}
