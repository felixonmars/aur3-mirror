pkgname=libpkcs11-gost
pkgver=4.2.0
pkgrel=2
pkgdesc="Module OpenSSL PKCS#11 GOST for Rutoken ECP"
url="http://www.rutoken.ru/"
license=("custom")
depends=("openssl")
conflicts=("libp11")
options=("!emptydirs")
arch=("i686"
      "x86_64")
source_i686=("https://download.rutoken.ru/Rutoken/Support_OpenSSL/${pkgver}/pkcs11-gost-linux-x86.zip")
source_x86_64=("https://download.rutoken.ru/Rutoken/Support_OpenSSL/${pkgver}/pkcs11-gost-linux-x64.zip")
md5sums_i686=("df581b5ef85afe4576371e8d2c6f9ae3")
md5sums_x86_64=("03ae35df988b2f7c8a0493300ec1025d")

package(){
  install -dm 0755                               "${pkgdir}/usr/lib/pkcs11-gost"
  install -Dm 0644 "${srcdir}/libp11.so.2"       "${pkgdir}/usr/lib/libp11.so.2"
  install -Dm 0644 "${srcdir}/libpkcs11_gost.so" "${pkgdir}/usr/lib/pkcs11-gost/libpkcs11_gost.so"
  install -Dm 0644 "${srcdir}/librtpkcs11ecp.so" "${pkgdir}/usr/lib/pkcs11-gost/librtpkcs11ecp.so"
}
