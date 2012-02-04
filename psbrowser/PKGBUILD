# Maintainer: Thorsten Töpper <atsutane-tu@freethoughts.de>

pkgname=psbrowser
pkgver=0.1.1
pkgrel=1
pkgdesc="A generic tool for browsing and publishing content in an XMPP implementation of a Pubsub service."
arch=('i686' 'x86_64')
url="http://projects.comum.org/psbrowser/"
license=('GPL')
depends=('taningia' 'libgee' 'gtk2')
makedepends=('vala')
source=(http://bau.comum.org/lincoln/psbrowser/$pkgname-$pkgver.tar.gz)
md5sums=('4b294a3060d87917f15f7a128dd9f752')

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
