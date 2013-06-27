# Maintainer of the patched version: Aleksejs Popovs <me@popoffka.ru>
# Developer: Michael Stapelberg <michael@i3wm.org>

pkgname=i3lock-custom
_pkgname=i3lock
epoch=1
pkgver=git
pkgrel=1
pkgdesc='A simple screen locker, patched to display additional information.'
url='https://github.com/popoffka/i3lock.git'
arch=('i686' 'x86_64')
license=('BSD')
depends=('xcb-util-image' 'xcb-util-keysyms' 'pam' 'libev' 'cairo')
makedepends=('pkg-config' 'libx11')
source=('https://github.com/popoffka/i3lock/archive/master.tar.gz')
sha1sums=('SKIP')

provides=("${_pkgname}")
conflicts=("${_pkgname}")

prepare() {
  mv "${srcdir}/${_pkgname}-master" "${srcdir}/${_pkgname}"
}

build() {
	cd "${srcdir}/${_pkgname}"
	make
}

package() {
	cd "${srcdir}/${_pkgname}"
	make PREFIX=/usr DESTDIR="${pkgdir}" install
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
