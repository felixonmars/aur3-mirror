# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=dmn
pkgver=0.4
pkgrel=1
epoch=
pkgdesc="DMN Modular Netgame is a videogame based on a classic Spanish game: 'Dominó'. The domino is a board game where two o four people can play, one player vs. other or two partners vs. other two. The player who runs out of dominoes wins."
arch=('x86_64' 'i386')
url="http://prdownloads.sourceforge.net/dmn/dmn-0.4.tar.bz2?download"
license=('GPL')
groups=()
depends=('libxml++')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(http://prdownloads.sourceforge.net/dmn/dmn-0.4.tar.bz2)
noextract=()
md5sums=('ac199340f278693e48c88c248ff9a694') #generate with 'makepkg -g'

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	tar xvjf $pkgname-$pkgver.tar.bz2
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
