# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer silvernode
#Based on dogecoin-qt-git by gee

pkgname=klondikecoin-qt-git
_gitname=klondikecoin
_binname=klondikecoin
proname=bitcoin
pkgver=0.8.6.1
pkgrel=2
pkgdesc="Cryptocurrency based on the Klondike Gold Rush"
arch=('x86_64' 'i686')
url="http://klondikecoin.com"
license=('MIT')
provides=('klondikecoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('git+https://github.com/klondikecoin/klondikecoin.git'
        'klondikecoin.desktop')
install=klondikecoin.install

sha256sums=(SKIP
            '477c8c8ab1da1bcc6169726236eff45e1a70bb8b3294255b2de87fad4ea67b44')

## files & commands for building


_qmake=qmake-qt4

pkgver() {
	cd "$srcdir/${_gitname}"
}
    

build() {
  echo "Removing Translations to succeed build..."
  sed '52,100d' $srcdir/${_gitname}/src/qt/bitcoin.qrc > $srcdir/${_gitname}/src/qt/bitcoin.qrc.new
  mv $srcdir/${_gitname}/src/qt/bitcoin.qrc.new $srcdir/${_gitname}/src/qt/bitcoin.qrc
	cd ${_gitname}
	
	${_qmake} ${proname}-qt.pro
		
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_gitname}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
