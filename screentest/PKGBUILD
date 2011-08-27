# Contributor: DonVla <donvla@users.sourceforge.net>

pkgname=screentest
pkgver=2.0
pkgrel=1
pkgdesc="Screentest is a CRT/LCD screen testing utility."
arch=(i686 x86_64)
url="http://screentest.sourceforge.net/"
license=('GPL')
depends=('cairo' 'libglade')
makedepends=('gcc')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('456d7079d1cd083fb3b61dca7b55d9b5')
sha256sums=('f77846ec2ed1555d338bc49f21632332d6cc12f91633a48abdbbd91cd15d1aa7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}

# vim:set ts=2 sw=2 et:
