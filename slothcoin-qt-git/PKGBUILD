pkgname=slothcoin-qt-git
pkgver=1.6.r0.g15e78bf
pkgrel=1
pkgdesc="Sloth coin cryptocurrency"
arch=('x86_64' 'i686')
url="http://slothcoin.org/"
license=('MIT')
provides=('slothcoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=("$pkgname::git+https://github.com/thimod/Slothcoin.git"
        slothcoin.desktop)
install=slothcoin.install
sha256sums=(SKIP
            '0fceb1246e68359e215940b548c7b81d05f967a9040d1c816b90c7162747ef2b')

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
    

build() {
	cd ${pkgname}
	qmake-qt4 slothcoin-qt.pro
	chmod +x src/leveldb/build_detect_platform
	cd src/leveldb
	make libleveldb.a libmemenv.a
	cd ../..
	make
}

package() {
	install -Dm644 slothcoin.desktop ${pkgdir}/usr/share/applications/slothcoin.desktop
	cd ${pkgname}
	install -Dm755 Slothcoin-Qt "$pkgdir"/usr/bin/slothcoin-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/slothcoin_256.png "$pkgdir"/usr/share/pixmaps/slothcoin.png
}
