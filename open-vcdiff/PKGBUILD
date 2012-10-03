# Maintainer: Romuald Texier-Marcadé <rtexier@elikya.com>
pkgname=open-vcdiff
pkgver=0.8.3
pkgrel=1
pkgdesc="An encoder/decoder for the VCDIFF (RFC3284) format (binary diff)."
url="http://code.google.com/p/open-vcdiff/"
arch=('x86_64' 'i686')
license=('Apache License 2.0')
depends=()
makedepends=()
conflicts=()
replaces=()
backup=()

source=("http://open-vcdiff.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha1sums=('fd14e8d46edac14988f1a6cab479bc07677d487c')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man --sysconfdir=/etc 
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
