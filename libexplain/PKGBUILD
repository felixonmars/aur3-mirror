# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=libexplain
pkgver=1.2
pkgrel=1
pkgdesc="A library which may be used to explain Unix and Linux system call errors."
arch=(i686 x86_64)
url="http://libexplain.sourceforge.net/"
license=('GPL3')
depends=('libcap')
options=('!libtool')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('b65d6be296c4773a69a3a14d41f66e68')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
