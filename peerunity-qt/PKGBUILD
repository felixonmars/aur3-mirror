## Maintainer: peerchemist

pkgname='peerunity-qt'
_gitname=peerunity
pkgver=0.1.2.RC2.r4.g0cf0117
pkgrel=1
pkgdesc="Peercoin network-compatible, community-developed wallet client."
arch=('x86_64' 'i686')
url="https://github.com/Peerunity/Peerunity"
license=('MIT')
provides=('peerunity-qt')
conflicts=('peerunity-git')
depends=('qt4' 'miniupnpc' 'boost-libs' 'qrencode')
makedepends=('git' 'boost' 'gcc' 'make' 'qrencode')
source=('git://github.com/peerunity/peerunity'
        'peerunity.desktop')
install=peerunity.install
sha256sums=('SKIP'
            '583372b932f7d9d072d18aecd8608e8bddce00c8801e1ea9f8f1c679be9c95c9')

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_gitname}/

	# make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1 USE_SSL=1 PIE=1
	make

}

package() {

	install -Dm644 peerunity.desktop ${pkgdir}/usr/share/applications/peerunity.desktop

	cd ${_gitname}
	install -Dm755 peerunity ${pkgdir}/usr/bin/peerunity-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/peerunity.png ${pkgdir}/usr/share/pixmaps/peerunity.png
}

