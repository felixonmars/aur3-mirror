# Contributor: Jens Pranaitis <jens@jenux.homelinux.org>

pkgname=bob-the-butcher
pkgver=0.7.1
pkgrel=2
pkgdesc="distributed password cracker package"
arch=('i686' 'x86_64')
url="http://btb.banquise.net"
license=('GPL')
depends=('libevent')
source=(http://download.openwall.net/pub/projects/john/contrib/parallel/btb/${pkgname}-${pkgver}.tar.gz)
md5sums=('c76fcbcf87e229fa6f1ec06d0eeac759')


prepare() {
  cp -r $pkgname-$pkgver $pkgname-$pkgver-sse2 
}

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  
  # first we build without sse2 support
  ./configure --prefix=/usr --disable-sse2
  make

  # now with sse2 support
  cd "${srcdir}/$pkgname-$pkgver-sse2"
  ./configure --prefix=/usr --program-suffix="-sse2"
  make
}

package() {
  # Install the sse2 disabled version
  cd "${srcdir}/$pkgname-$pkgver"

  make DESTDIR="${pkgdir}/" install
  
  # Install the sse2 enabled version
  cd "${srcdir}/$pkgname-$pkgver-sse2"

  make DESTDIR="${pkgdir}/" install
}

# vim:set ts=2 sw=2 et:
