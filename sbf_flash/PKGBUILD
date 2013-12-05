# Maintainer: Chuan Ji <jichuan89@gmail.com>

pkgname=sbf_flash
pkgver=20110401
pkgrel=1
pkgdesc='Linux util for flashing SBF files to Android phones'
arch=('i686' 'x86_64')
url='http://blog.opticaldelusion.org/search/label/sbf_flash'
depends=('cpio')
source=('http://dl.opticaldelusion.org/sbf_flash')
md5sums=('db8afd24f7a0dc6d3d78556dec811694')
license=('Unknown')

package(){
  cd "${srcdir}"
  install -Dm755 "./${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
