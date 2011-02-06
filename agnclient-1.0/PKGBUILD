pkgname=agnclient-1.0
pkgver=2.0.1
_buildver=3003
pkgrel=3003
pkgdesc='AT&T Global Network client'
arch=('i686')
_arch=i386
license=('custom')
url="http://attnetclient.com"
source=(ftp://ftp.attglobal.net/pub/custom/ibm_linux/${pkgname}-${pkgver}.${_buildver}.${_arch}.rpm)
sha512sums=('c9e1073abf7704587d66b7c63352a943a943f7d7f60504237bf2b1bc81df8bc9552f98dde4a242d030ce6b269eeebf8dfebce5e21ba016a0522fefc8c40cc6a1')
depend=('openssl')
makedepends=('libarchive')

build() {
  cd ${pkgdir}
  bsdcpio -id < ${srcdir}/${pkgname}-${pkgver}.${_buildver}.${_arch}.rpm
}
