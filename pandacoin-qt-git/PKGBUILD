#pandacoin-qt Arch PKGBUILD
#Maintainer otis <electricbuck@gmail.com> 
#Based of dogecoin-qt-git by gee

pkgname=pandacoin-qt-git
_gitname=pandacoin
pkgver=v3.0.2.r0.g24c836a
pkgrel=1
pkgdesc="A Qt wallet for the cryptocurrency PandaCoin (PND)"
arch=('x86_64' 'i686')
url="http://pandacoinpnd.org/"
license=('MIT')
provides=('pandacoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=('git+https://github.com/pandacoin-official/pandacoin'
        'pandacoin.desktop')
install=pandacoin.install

sha256sums=('SKIP'
            '5e5fe52861895706c176c574a071402ca2de11e209f0f3d46d01c16afa3876fe')

## files & commands for building
_qmake=qmake-qt4

pkgver() {
	cd "$srcdir/${_gitname}"
	git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}
    

build() {
	cd ${_gitname}

	${_qmake} ${_gitname}-qt.pro
        
	make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_gitname}.desktop ${pkgdir}/usr/share/applications/${_gitname}.desktop

	cd ${_gitname}
	install -Dm755 ${_gitname}-qt "$pkgdir"/usr/bin/${_gitname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/novacoin-128.png "$pkgdir"/usr/share/pixmaps/${_gitname}.png
}
