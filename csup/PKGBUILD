pkgname=csup
pkgver=20060318
pkgrel=1
pkgdesc="CVSup replacement for checkout-only functionality"
arch=(i686 x86_64)
license=('BSD')
url="http://www.mu.org/~mux/csup.html"
depends=("openssl" "zlib")
source=("http://mu.org/~mux/csup-snap-${pkgver}.tgz")
md5sums=("9218f06f13ed28d1086eec413a734915")

build() {
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/man/man1

  cd ${srcdir}/csup
  make || return 1
  install -s -m 755 csup ${pkgdir}/usr/bin/csup
  install -m 444 csup.1.gz ${pkgdir}/usr/share/man/man1/csup.1.gz
}

