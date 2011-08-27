# -*- shell-script -*-
#
# Contributor: Adrian C. <anrxc..sysphere.org>

pkgname=xwrits
pkgver=2.26
pkgrel=1
pkgdesc="Xwrits reminds you to take regular wrist breaks, and prevent RSI"
arch=("i686" "x86_64")
url="http://www.lcdf.org/xwrits"
license=("GPL")
depends=("libx11" "libxext" "libxinerama")
makedepends=("xproto" "xineramaproto")
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=("3e20a00321e264da2b058432fadcff76")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="${pkgdir}" install || return 1
}
