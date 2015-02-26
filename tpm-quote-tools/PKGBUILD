# Maintainer: Caleb Johnson <tpmqtaur@rcpt.at>
pkgname=tpm-quote-tools
pkgver=1.0.2
pkgrel=1
pkgdesc="Programs that provide support for TPM-based attestation"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/tpmquotetools"
license=('BSD')
depends=('trousers' 'tpm-tools')
source=(http://downloads.sourceforge.net/project/tpmquotetools/${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('68ae56b8d319b02017b9dca15d45335fe60b16c31ad0974d5f5ec508434b6e9d')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
