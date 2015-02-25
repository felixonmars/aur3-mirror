# Maintainer: kleim <kleim8  at yahoo dot fr>
# Contributor: Robert Knauer <robert@privatdemail.net>
# Contributor: xav <xav at ethertricks dot net>

pkgname=umurmur-polarssl
_pkgsrcname=umurmur
pkgver=0.2.15
pkgrel=2
pkgdesc="Minimalistic Mumble server. Uses mbedtls (formerly polarssl) for an even lower memory footprint."
arch=('i686' 'x86_64' 'armv7h')
url="http://code.google.com/p/umurmur/"
license=('custom:BSD-3-Clause')
depends=('mbedtls' 'libconfig' 'protobuf-c')
conflicts=('umurmur')
source=(
  "https://github.com/fatbob313/${_pkgsrcname}/archive/${pkgver}.tar.gz"
  "${_pkgsrcname}.service"
)
sha1sums=(
  'bb4227020b43db1a74743298ace178499629f2b5' 
  '866d8a086bd6920d9be3bad9718aa034fdbbc29d'
)
install="${pkgname}.install"

build() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr --mandir=/usr/share/man --with-ssl=polarssl
  make
}

package() {
  cd "${srcdir}/${_pkgsrcname}-${pkgver}"
  make DESTDIR=${pkgdir} install || return 1
  install -Dm644 'umurmur.conf.example' "${pkgdir}/etc/umurmur/umurmur.conf.example"
  install -Dm644 "${srcdir}/umurmur.service" "${pkgdir}/usr/lib/systemd/system/umurmur.service"
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
