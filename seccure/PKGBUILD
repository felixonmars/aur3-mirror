pkgname="seccure"
pkgver="0.4"
pkgrel="1"
pkgdesc="Encrypt, decrypt and sign securely using only a password"
arch=('i686' 'x86_64')
url="http://point-at-infinity.org/seccure"
license=('GPL2')
depends=('libgcrypt')
makedepends=()
conflicts=()
replaces=()
backup=()
options=('zipman')
source=("http://point-at-infinity.org/seccure/$pkgname-$pkgver.tar.gz")
# Version specific
sha1sums=("883e335f58cc36279c33493ab219f4940a46dab8")

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/share/man/man1"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/licences/$pkgname"
  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
