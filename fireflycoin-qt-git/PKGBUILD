# Maintainer: William Penton <aur at williampenton dot com>
#

pkgname='fireflycoin-qt-git'
_gitname=FireFlyCoin
pkgver=0.9.1
pkgrel=4
pkgdesc="Designed for collectors and traders."
arch=('x86_64' 'i686')
url="https://github.com/FireFlyCoin/FireFlyCoin"
license=('MIT')
provides=('fireflycoin-qt')
conflicts=('fireflycoin-qt' 'fireflycoind-git')
depends=('qt4' 'miniupnpc' 'boost-libs' 'qrencode' 'leveldb')
makedepends=('git' 'boost' 'gcc' 'make' 'qrencode' 'leveldb')
source=('git://github.com/FireFlyCoin/FireFlyCoin'
        'fireflycoin.desktop')
install=fireflycoin.install
sha256sums=(SKIP 
            '0c11dff7bf779052598b06a739c56e121f98024e47b7bfa9080440b17bb24aab')

pkgver() {
	cd "$srcdir/$_gitname"
	# Use tag of the last commit, but removing the prefix
	git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd ${_gitname}/src/leveldb/
	chmod +x build_detect_platform
	make libleveldb.a libmemenv.a
	
	# and make qt gui
	cd ../..
	qmake-qt4 USE_QRCODE=1 USE_UPNP=1
	cd src/
	make -f makefile.unix
	cd ..
	make
}

package() {

	install -Dm644 fireflycoin.desktop ${pkgdir}/usr/share/applications/fireflycoin.desktop

	cd ${_gitname}
	install -Dm755 fireflycoin-qt ${pkgdir}/usr/bin/fireflycoin-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png ${pkgdir}/usr/share/pixmaps/fireflycoin.png
}

