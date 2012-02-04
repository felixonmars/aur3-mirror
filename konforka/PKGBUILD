# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=konforka
pkgver=0.0
pkgrel=1
pkgdesc="A convenience library for projects from http://kin.klever.net"
arch=('i686' 'x86_64')
url="http://kin.klever.net/konforka/"
license=('MIT')
depends=('gcc-libs')
makedepends=('pkgconfig')
options=('!libtool')
source=("http://kin.klever.net/dist/$pkgname-$pkgver.tar.bz2")
md5sums=('53caf029a0e09b7e5410c94ac6294c4c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --with-pkgconfigdir=/usr/lib/pkgconfig
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -D -m644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
