# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer gee
#Based of primecoin-qt by Daniel Spies

pkgname=protoshares-qt-git
_gitname=ProtoShares
_binname=protoshares
pkgver=0.8.5.45.g6b3776c
pkgrel=2
epoch=1
pkgdesc="Cryptocurrency with Scientific Computing Momentum Proof-of-Work"
arch=('x86_64' 'i686')
url="http://invictus-innovations.com/protoshares"
license=('MIT')
provides=('protoshares-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=('git+https://github.com/InvictusInnovations/ProtoShares.git'
        'protoshares.desktop')
install=protoshares.install

sha256sums=(SKIP
            '7b25bb8b379b27bf9c3900f3ac582e2bc1eda1fb500303d81bf42f4931646e2c')

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe | sed "s/^v//; s/-/./g"
}
    

build() {
	#cd ${_gitname}/src
	cd ${_gitname}
	
	# build protoshares
	msg "Building ProtoShares daemon"
	${_qmake} protosharesd.pro USE_BUILD_INFO=1 USE_SSL=1
	make USE_UPNP=1 USE_SSL=1 || make USE_UPNP=1 USE_SSL=1
	
	# build protoshares-qt
	msg "Building ProtoShares QT GUI"
	#cd ..
	${_qmake} protoshares-qt.pro
	make clean
	make
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_gitname}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm755 ${_binname}d "$pkgdir"/usr/bin/${_binname}d
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}256.png
}
