# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=irclib
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="C Irc Library for IRC functions"
arch=('i386' 'x86_64')
url="https://github.com/AftExploision/CIrcLib"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=irclib.install
changelog=
source=(source.tar.gz)
noextract=()
md5sums=('7220f79716ef2b7e00794aa8fb276fd9') #generate with 'makepkg -g'

prepare() {
	mkdir "$srcdir/$pkgname-$pkgver" -p
	#patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	mkdir "CIrcLib"
	tar -xf "$startdir/source.tar.gz" -C "$srcdir/$pkgname-$pkgver/CIrcLib"	
	cd "$srcdir/$pkgname-$pkgver/CIrcLib"
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$srcdir/$pkgname-$pkgver/CIrcLib"
	make DESTDIR="$pkgdir/" install
	make INCDIR="$pkgdir/" headers
}
