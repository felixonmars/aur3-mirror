# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=taningia
pkgver=0.2
pkgrel=1
pkgdesc="A simple and modern comunication library that provides tools to write softwares based on XMPP."
arch=('i686' 'x86_64')
url="http://projects.comum.org/taningia/"
license=('GPL')
depends=('iksemel')
source=(http://bau.comum.org/lincoln/taningia/$pkgname-$pkgver.tar.gz)
md5sums=('caabc83033b3f07c7167424b68e9b2c9')

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
