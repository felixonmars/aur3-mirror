# Maintainer: josephgbr <rafael.f.f1 at gmail.com>
# Contributor: Clement Siuchung Cheung <clement.cheung@umich.edu>

pkgname=lib-compat
pkgver=1.4.2
pkgrel=3
pkgdesc="Gentoo lib compat for old programs only available in binary"
arch=('i686' 'x86_64')
url="http://www.gentoo.org/"
license=('GPL2')
[ $CARCH == x86_64 ] &&	depends=('lib32-glibc')
provides=('lib32-lib-compat')
conflicts=('lib32-lib-compat')
source=(http://distfiles.gentoo.org/distfiles/${pkgname}-${pkgver}.tar.bz2)
md5sums=('62b82bef44dd426dc8569a8d02a46477')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}/x86"
  
  if [ $CARCH == x86_64 ]; then
     local _installdir="${pkgdir}/usr/lib32/"
  elif [ $CARCH == i686 ]; then
     local _installdir="${pkgdir}/usr/lib/"
  fi
  
  install -dm755 "${_installdir}"
  install * "${_installdir}"
}
