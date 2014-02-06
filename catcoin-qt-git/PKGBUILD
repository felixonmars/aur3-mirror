#Maintainer acerix
#Based of dogecoin-qt-git by gee

pkgname=catcoin-qt-git
_gitname=CatcoinRelease
_binname=catcoin
pkgver=0.8.9
pkgrel=1
pkgdesc="Cryptocurrency"
arch=('x86_64' 'i686')
url="http://www.catcoins.org/"
license=('MIT')
provides=('catcoin-qt')
depends=('qt4' 'miniupnpc' 'boost-libs')
makedepends=('boost' 'gcc' 'make' 'git')
source=("$pkgname"::'git://github.com/CatcoinOfficial/CatcoinRelease.git'
        'catcoin.desktop')

sha256sums=(SKIP
	    '2264079fac85c437190ff361d83555f7105fd876f665a702104fb2e99e391caa')

_qmake=qmake-qt4

# this doesn't seem to work correctly
#pkgver() {
#    cd "$srcdir/$pkgname"
#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
#}

build() {
    cd "$srcdir/$pkgname"
	${_qmake} ${_binname}-qt.pro
	make ${MAKEFLAGS} || make ${MAKEFLAGS}
}

package() {
	install -Dm644 ${_binname}.desktop ${pkgdir}/usr/share/applications/${_binname}.desktop
    cd "$srcdir/$pkgname"
	install -Dm755 ${_binname}-qt "$pkgdir"/usr/bin/${_binname}-qt
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -Dm644 src/qt/res/icons/${_binname}.png "$pkgdir"/usr/share/pixmaps/${_binname}.png
}

