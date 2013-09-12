# Maintainer: Mort Yao <mort.yao@gmail.com>

pkgname=gawk-source
pkgver=4.1.0
pkgrel=1
pkgdesc="GNU version of awk"
arch=('any')
url="http://www.gnu.org/software/gawk/"
license=('GPL')
source=(ftp://ftp.gnu.org/pub/gnu/gawk/gawk-${pkgver}.tar.gz)
md5sums=('13e02513105417818a31ef375f9f9f42')

package() {
  mkdir -p "${pkgdir}/usr/src"
  mv gawk-${pkgver//_/-} "${pkgdir}/usr/src"
}
