# Maintainer: André van Delden <andre.van.delden@uni-bremen.de>

pkgname=hets-lib
_libname=hets
pkgver=20141215
pkgrel=1

pkgdesc="The central libraries for CASL and its extensions"
url="http://www.informatik.uni-bremen.de/cofi/index.php/Libraries"
license='custom:hets-license'

arch=('any')
source=('http://www.informatik.uni-bremen.de/cofi/lib.tgz')
sha512sums=('2b784a84611dc636d7133629e2499d8de9f22f0c1e02c8ca1f2cd89388fae1495af7bd824696ed51746268206632e455edc66eff306e261a09c97875483aa5ce')

package() {
  cd ${srcdir}

  # install the libraries
  install -d ${pkgdir}/usr/share/lib${_libname}
  cp -r Hets-lib/* ${pkgdir}/usr/share/lib${_libname}

  # install license
  install -Dm644 ${srcdir}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
# vim:syntax=sh
