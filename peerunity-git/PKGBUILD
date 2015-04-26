## Maintainer: peerchemist

pkgname='peerunity-git'
_gitname=peerunity
pkgver=0.1.2.RC3.r14.gd0cbc83
pkgrel=4
pkgdesc="Peercoin network-compatible, community-developed wallet client."
arch=('x86_64' 'i686')
url="https://github.com/Peerunity/Peerunity"
license=('MIT')
provides=('peerunity')
conflicts=('peerunity-stable')
depends=('qt4' 'miniupnpc' 'boost-libs' 'qrencode')
makedepends=('git' 'boost' 'gcc' 'make' 'qrencode' 'miniupnpc')
install=peerunity.install
source=('git://github.com/peerunity/peerunity'
        'peerunity.desktop')
sha256sums=('SKIP'
            '289a4df1e02ca74fba8bf67562b93486a78cdb3d88fe3e5d14202ff4345a7461')

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_gitname}/

	# make qt gui
	qmake-qt4 USE_QRCODE=1 USE_DBUS=1 USE_UPNP=0 USE_SSL=1 PIE=1
	make

}

package() {

	install -Dm644 peerunity.desktop ${pkgdir}/usr/share/applications/peerunity.desktop

	cd ${_gitname}

	mkdir -p ${pkgdir}/usr/share/pixmaps
	install -Dm644 share/pixmaps/peerunity16.xpm ${pkgdir}/usr/share/pixmaps/
	install -Dm644 share/pixmaps/peerunity32.xpm ${pkgdir}/usr/share/pixmaps/
	install -Dm644 share/pixmaps/peerunity64.xpm ${pkgdir}/usr/share/pixmaps/
	install -Dm644 share/pixmaps/peerunity128.xpm ${pkgdir}/usr/share/pixmaps/

	mkdir -p ${pkgdir}/usr/share/icons/hicolor/{16x16,32x32,64x64,128x128,256x256}/apps
	install -Dm644 share/pixmaps/peerunity16.png ${pkgdir}/usr/share/icons/hicolor/16x16/apps/peerunity.png
	install -Dm644 share/pixmaps/peerunity32.png ${pkgdir}/usr/share/icons/hicolor/32x32/apps/peerunity.png
	install -Dm644 share/pixmaps/peerunity64.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/peerunity.png
	install -Dm644 share/pixmaps/peerunity128.png ${pkgdir}/usr/share/icons/hicolor/128x128/apps/peerunity.png
	install -Dm644 share/pixmaps/peerunity256.png ${pkgdir}/usr/share/icons/hicolor/256x256/apps/peerunity.png

	install -Dm755 peerunity ${pkgdir}/usr/bin/peerunity
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	
}

