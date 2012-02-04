#Contributor: grimi <grimi at poczta dot fm>

pkgname=gdm-simple-archer
_pkgname=simple-archer
pkgver=1.0
pkgrel=3
pkgdesc="Archer ArchLinux theme"
arch=('any')
url="http://www.archlinux.org"
license=('GPL')
depends=('gdm-old')
source=(${_pkgname}.tar.bz2)
md5sums=('c40bb7daa3826d35c031f8adc3886fa2')

package() {
  install -d "${pkgdir}"/usr/share/gdm/themes/${_pkgname}
  install -m644 "${srcdir}"/${_pkgname}/*.* "${pkgdir}"/usr/share/gdm/themes/${_pkgname}
}

