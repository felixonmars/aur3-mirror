# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer gee
#Based of primecoin-qt by Daniel Spies

pkgname=coffeecoin-qt
_gitname=Coffecoin-2.0
_binname=coffeecoin
_pname=CoffeeCoin2.0-Qt
pkgver=0.7.2
pkgrel=2
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="https://bitcointalk.org/index.php?topic=596562.0"
license=('MIT')
provides=('coffeecoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('git+https://github.com/Orangecoins/Coffecoin-2.0.git'
        'coffeecoin.desktop')
install=coffeecoin.install

sha256sums=(SKIP
            '3d3cccedb6002c66c5299625754fcf4f540e9173e172afe44e42ee562987e1f6')

## files & commands for building
_qmake=qmake-qt4

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
    

build() {
	cd ${_gitname}

	${_qmake} ${_binname}-qt.pro

	#./autogen.sh
	
	#./configure --with-incompatible-bdb
	make 
	#${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_gitname}
	install -Dm755 ${_pname} "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 src/qt/res/icons/CoffeeCoin2.0.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
