pkgname=fcitx-hangul
pkgver=0.1.2
pkgrel=1
pkgdesc="Hangul (Korean) support for fcitx"
arch=('i686' 'x86_64')
url="http://code.google.com/p/fcitx/"
license=('GPLv2')
provides=('fcitx-hangul')
depends=('fcitx>=4.2.2' 'libhangul')
makedepends=('cmake' 'intltool')
source=(http://fcitx.googlecode.com/files/$pkgname-$pkgver.tar.xz)
sha1sums=('30648e569ea75e2a734ed98f8cc90b0a656a6bf5')

build() {
   cd "$srcdir"
   rm -rf "$pkgname-$pkgver-build"
   cp -r "$pkgname-$pkgver" "$srcdir/$pkgname-$pkgver-build"
   cd "$pkgname-$pkgver-build"

   cmake . -DCMAKE_INSTALL_PREFIX='/usr' -DCMAKE_BUILD_TYPE=Release
   make || return 1
}

package() {
   cd "$srcdir/$pkgname-$pkgver-build"
   make DESTDIR=$pkgdir install
}


