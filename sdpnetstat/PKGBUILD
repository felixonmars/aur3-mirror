# Maintainer: Anthony Cornehl <accornehl[at]gmail[dot]com>
# https://github.com/twinshadow/abs
pkgname=sdpnetstat
pkgver=1.60
_subver=0.3
_commit=gb6e7425
pkgrel=3
pkgdesc="netstat for SDP"
groups=('ofed')
url="http://www.openfabrics.org"
arch=('x86_64' 'i686')
license=('GPL2')
depends=('glibc')
source=("https://www.openfabrics.org/downloads/${pkgname}/${pkgname}-${pkgver}-${_subver}.${_commit}.tar.gz")
# cksum start
md5sums=('ab7a164d2d43c642263a654ad310816e')
sha512sums=('249a5e8d99bf09244528abd7b901d189013c47f3ec1af363ca27cd29ef7fc21c7f6016eeda150e3533c6e361f89e28b6bbfb0e57159bdfd6243089cacc0b6787')
# cksum end

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ( while echo 2>/dev/null; do true; done ) | make -j1 netstat
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm0755 netstat "$pkgdir/usr/bin/sdpnetstat"
}
