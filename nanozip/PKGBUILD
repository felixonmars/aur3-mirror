# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: attila589 <attila589 at gmail dot com>

pkgname=nanozip
pkgver=0.09a
pkgrel=1
pkgdesc="An experimental file archiver. It consists of several original compressors, put into a single file archiver program aiming for high compression efficiency."
arch=('i686' 'x86_64')
url="http://www.nanozip.net/"
#depends=()
license=('unknown')
if [[ "$CARCH" == 'i686' ]]; then
  source=(http://www.nanozip.net/${pkgname}-${pkgver}.linux32.zip)
  sha256sums=('db94977e80bbab02d122e7bd6f6f83c7767931a4014bde8eef1b2a5a9ae7dde1')
else
  source=(http://www.nanozip.net/${pkgname}-${pkgver}.linux64.zip)
  sha256sums=('e66dd3f9e0a1da9137a1483c36c9979f3ff1dbf1175876a047504ee4ff4b2cd7')
fi

package() {
  install -Dm755 ${srcdir}/nz ${pkgdir}/usr/bin/nz
}
