# Maintainer: sinetek
pkgname=librexcoin-qt-git
pkgver=r3.82db8ec
pkgrel=1
pkgdesc="Cryptocurrency"
_gitname=librexcoin
_binname=librexcoin
arch=('x86_64' 'i686')
url="http://librexcoin.com/"
license=('MIT')
groups=()
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
optdepends=()
provides=('librexcoin-qt')
conflicts=()
replaces=()
backup=()
options=()
#install=$pkgname.install
changelog=
source=('git+https://github.com/librexcoin/librexcoin.git')
noextract=()
md5sums=('SKIP')

pkgver () {
	cd "$srcdir/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd ${_gitname}
	qmake-qt4 ${_binname}-qt.pro
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	cd ${_gitname}
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/librexcoin.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}

