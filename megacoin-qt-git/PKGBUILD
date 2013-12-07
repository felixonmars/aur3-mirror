#Maintainer gee

pkgname=megacoin-qt-git
_gitname=megacoin
pkgver=0.1
pkgrel=2
epoch=1
pkgdesc="P2P Cryptocurrency"
arch=('x86_64' 'i686')
url="http://www.megacoin.co.nz/"
license=('MIT')
provides=('megacoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=('git+https://github.com/megacoin/megacoin.git'
        'megacoin.desktop')
install=megacoin.install

md5sums=('SKIP'
         '329d499c5caba0c23799e6f41e0670b8')

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

pkgver() {
        cd "$srcdir/${_gitname}"
        git describe | sed "s/^v//; s/-/./g"
}
                

build() {
	cd ${_gitname}
	
	${_qmake} megacoin-qt.pro USE_BUILD_INFO=1 USE_SSL=1
	make USE_UPNP=1 USE_SSL=1 || make USE_UPNP=1 USE_SSL=1
	
	#${_qmake} protoshares-qt.pro
	#make clean
	#make
}

package() {
	install -Dm644 ${_gitname}.desktop ${pkgdir}/usr/share/applications/${_gitname}.desktop

	cd ${_gitname}
	install -Dm755 ${_gitname}-qt "$pkgdir"/usr/bin/${_gitname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/${_gitname}.png "$pkgdir"/usr/share/pixmaps/${_gitname}256.png
}
