# Maintainer: cwerner <cw@rizzistrasse.at>

pkgname=mysms
pkgver=2.0
_anotherpkgver=-1
pkgrel=1
pkgdesc="A application to send messages between multiple devices"
arch=('x86_64' 'i686')
license=('custom:"Copyright (c) 2013 mysms.com"')
install=mysms.install
url="http://www.mysms.com"
changelog='mysms.changelog'
options=()
conflicts=()

if [ "${CARCH}" = "x86_64" ]; then
  md5sums=('7d1e0d6c216dcc0c6f3f9f4ce1cf64b3')
  _carch=amd64
elif [ "${CARCH}" = "i686" ]; then
  md5sums=('9acacb8819d5a10154dee2d99b8f6441')
  _carch=i386
fi

depends=()
optdepends=()
source=("http://download.opensuse.org/repositories/home:/${pkgname}/Debian_7.0/${_carch}/${pkgname}_${pkgver}${_anotherpkgver}_${_carch}.deb")

package() {
  cd "${srcdir}"

  ar x "${pkgname}_${pkgver}${_anotherpkgver}_${_carch}.deb" > /dev/null
  tar -xzf data.tar.gz -C "${pkgdir}"
  
  install -d "${pkgdir}/usr/"


}
