# Maintainer: Jakub Schmidtke <sjakub-at-gmail-dot-com>

pkgname=yassl
pkgver=1.9.8
pkgrel=1
pkgdesc="yaSSL - a small, portable, embedded SSL programming library"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/yassl/"
license=('GPL')
depends=('glibc' 'zlib')
source=(http://downloads.sourceforge.net/sourceforge/yassl/${pkgname}-${pkgver}.zip)
md5sums=('e3f1e397880d20236a6f27961fe0dd7d')
sha1sums=('f17800357a3e14e9a8ce143de0b9e26b181472af')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install-recursive

  # some test tools:
  rm -rf "${pkgdir}/usr/bin"

  mkdir -p "${pkgdir}/usr/include"
  cp -a "${srcdir}/${pkgname}-${pkgver}/include" "${pkgdir}/usr/include/yassl"
  cp -a "${srcdir}/${pkgname}-${pkgver}/taocrypt/include" "${pkgdir}/usr/include/yassl/taocrypt"
}
