# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

#Maintainer gee
#Based of primecoin-qt by Daniel Spies

pkgname=emerald-qt-git
_gitname=emerald
_binname=emerald
pkgver=0.8.5.r45.g6b3776c
pkgrel=2
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://emeraldcoin.wordpress.com/"
license=('MIT')
provides=('emerald-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make')
source=('git+https://github.com/emeraldproject/emerald.git'
        'emerald.desktop')
install=emerald.install

sha256sums=(SKIP
            '8798247cc672f90ef776071e4f545d89ac4dfc38fe76efa23638adb2ecfbe0d9')

## files & commands for building
_makefile_unix=makefile.unix
_qmake=qmake-qt4

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
    

build() {
	cd ${_gitname}
	sed -i "s/-loleaut32//" ${_binname}-qt.pro
	${_qmake} ${_binname}-qt.pro
	make ${MAKEFLAGS} 
	#|| make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop

	cd ${_gitname}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/bitcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}
