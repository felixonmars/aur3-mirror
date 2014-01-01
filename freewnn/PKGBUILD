# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=freewnn
pkgver=1.1.1_a022
_sfver=59257
pkgrel=1
pkgdesc='A network-extensible Kana-to-Kanji conversion system'
arch=('i686' 'x86_64')
url="http://sourceforge.jp/projects/freewnn/"
license=('GPL')
depends=('glibc')
source=("http://iij.dl.sourceforge.jp/freewnn/${_sfver}/FreeWnn-${pkgver//_/-}.tar.bz2")

build() {
	cd "${srcdir}/FreeWnn-${pkgver//_/-}"
	sed -i 's/WNNOWNER = wnn/WNNOWNER = root/' makerule.mk.in
	./configure --prefix=/usr --mandir=/usr/share/man --disable-cWnn --disable-kWnn --disable-sub-bindir
	make
}

package() {
	cd "${srcdir}/FreeWnn-${pkgver//_/-}"
	make DESTDIR="$pkgdir" install
	make DESTDIR="$pkgdir" install.man
}

md5sums=('9e42ae101ab57ea7b69028a9007fc5f3')
