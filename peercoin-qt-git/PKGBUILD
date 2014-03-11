# Maintainer: <dx /dot/ 1178 at gmail /dot/ com>
#

pkgname='peercoin-qt-git'
_gitname=ppcoin
pkgver=0.3.0ppc.r38.g55dda99
pkgrel=3
pkgdesc="The secure and sustainable cryptocurency"
arch=('x86_64' 'i686')
url="https://github.com/ppcoin/ppcoin"
license=('MIT')
provides=('peercoin-qt')
conflicts=('peercoin-qt' 'peercoind-git')
depends=('qt4' 'miniupnpc' 'boost-libs' 'qrencode')
makedepends=('git' 'boost' 'gcc' 'make' 'qrencode')
source=('git://github.com/ppcoin/ppcoin'
        'peercoin.desktop')
install=peercoin.install
sha256sums=(SKIP 
            '3d181809042d5a836ada4c6476daa5592d65f338a0aad910e7fdb5a635302272')

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_gitname}/

	# and make qt gui
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	make

}

package() {

	install -Dm644 peercoin.desktop ${pkgdir}/usr/share/applications/peercoin.desktop

	cd ${_gitname}
	install -Dm755 ppcoin-qt ${pkgdir}/usr/bin/peercoin-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/ppcoin.png ${pkgdir}/usr/share/pixmaps/peercoin.png
}

