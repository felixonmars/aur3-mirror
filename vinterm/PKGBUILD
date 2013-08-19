# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=vinterm
pkgver=0.5.0
pkgrel=1
pkgdesc="A terminal emulator that simulates the looks of a 1980s monitor."
arch=(i686 x86_64)
url="http://code.google.com/p/vinterm/"
license=('GPL3')
depends=('desktop-file-utils' 'hicolor-icon-theme' 'libao' 'libconfig' 'sdl')
install="$pkgname.install"
source=("http://vinterm.googlecode.com/files/$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver-makefile.patch")
md5sums=('307d2285565d9699d62bfc72b8e445c3'
         '64cc48ac65249dc26cbb2d9aa3eac1d0')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../${source[1]}
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make PREFIX=/usr DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
