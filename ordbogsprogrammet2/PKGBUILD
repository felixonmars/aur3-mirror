# Maintainer: Palle Ravn <ravnzon@gmail.com>
# Contributor: Troels Mæhl Folke
pkgname=ordbogsprogrammet2
pkgver=26108
pkgrel=1
pkgdesc="A danish online based dictionary service with multiple languages (ordbogen.com)"
arch=('x86_64')
url="http://www.ordbogen.com"
license=('custom')
depends=('qt>=4.5.0', 'openssl')
source=(http://www.ordbogen.com/downloads/program/version2/${pkgname}_${pkgver}-1_amd64.deb)
noextract=('$pkgname_$pkgver_amd64.deb')
md5sums=('f8b2bf71769df7724ff38538557d97f9')

build() {
  cd $srcdir
  ar x ${pkgname}_${pkgver}-1_amd64.deb
  tar -xzf data.tar.gz
  find usr -type f -exec install -m555 -D {} $pkgdir/{} \; || return 1
  mkdir $pkgdir/usr/lib
  ln -s /usr/lib/libcrypto.so ${pkgdir}/usr/lib/libcrypto.so.0.9.8 || return 1
}
