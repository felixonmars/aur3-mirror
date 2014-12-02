# Maintainer: Jonathan Doman <jonathan.doman@gmail.com>
# Contributor: Bradley Pesicka <bradley.c.pesicka@gmail.com>

pkgname=namecoin-qt-git
pkgdesc='A decentralized open source information registration and transfer system'

# Some people put long v.x.y.z-gABCDEF versions here, but it's pointless for a
# Git package since it's out of date within a day. So use only major/minor
# numbers which may or may not get updated, but at least it's prettier.
pkgver=0.3
pkgrel=2
epoch=2

arch=('i686' 'x86_64')
url='http://namecoin.info'

# If you don't want to use Qt5, it should build with Qt4 as well.
# s/qt5-base/qt4/;s/qt5-tools//;s/qmake/qmake-qt4/
depends=('qt5-base' 'boost-libs' 'miniupnpc' 'qrencode>=3.2' 'desktop-file-utils')
makedepends=('git' 'boost' 'qt5-tools')
conflicts=('namecoin-qt')
provides=('namecoin')
license=('MIT')
install=namecoin-qt.install
source=("${pkgname}::git+https://github.com/namecoin/namecoin.git"
	     "namecoin.desktop")
md5sums=('SKIP'
         '4a1b23bed83b4c21226c10d1695fe48e')

pkgver() {
	cd "$pkgname"
   git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/$pkgname"
	qmake MINIUPNPC_INCLUDE_PATH=/usr/include/miniupnpc USE_QRCODE=1
	make
}

package() {
   # Install binary
   install -Dm755 {"$srcdir/$pkgname","$pkgdir/usr/bin"}/namecoin-qt 

   # Install icon
   install -Dm644 "$srcdir/$pkgname/src/qt/res/icons/bitcoin.png" "$pkgdir/usr/share/pixmaps/namecoin-qt.png"

   # Install license
   install -Dm644 {"$srcdir/$pkgname","$pkgdir/usr/share/licenses/namecoin-qt"}/COPYING

   # Install launcher
   install -Dm644 "$srcdir/namecoin.desktop" "$pkgdir/usr/share/applications/namecoin-qt.desktop"
}
