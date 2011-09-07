# Maintainer : Gergely Imreh <imrehgATgmailDOTcom>
pkgname=xportdmv
pkgver=1.01
pkgrel=1
pkgdesc="Xport transport stream demuxer"
arch=('i686' 'x86_64')
url="http://www.w6rz.net/"
license=('Unknown')
depends=('glibc')
makedepends=('gcc')
source=("http://www.w6rz.net/xport.zip")

build() {
  cd "${srcdir}"
  gcc -o xportdmv xport.c
}

package() {
  cd "${srcdir}"
  install -D -m 755 xportdmv "${pkgdir}/usr/bin/xportdmv"
}
md5sums=('4391519a2b170313e0d51d28629b0a22')
