# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>

pkgname=hptalx
pkgver=1.3.1a
pkgrel=1
pkgdesc="A HP Calculator<->PC communications program for Linux"
arch=('i686' 'x86_64')
url="http://hptalx.sourceforge.net/"
license=('GPL')
depends=('libxml2' 'gtk2')
install=
source=(http://downloads.sourceforge.net/sourceforge/$pkgname/$pkgname-${pkgver}.tar.gz)
md5sums=('daa046952a19590e13a50cb4c2a6ac46')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
