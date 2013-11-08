# Maintainer: Ethan Zonca <ethanzonca@ethanzonca.com>

pkgname=python2-geographiclib
_pkgname=geographiclib
pkgver=1.31
pkgrel=1
pkgdesc="Small set of Python classes for performing conversions between geographic, UTM, UPS, MGRS, geocentric, and local cartesian coordinates, for gravity (EGM2008) and geomagnetic field (WMM2010) and calculations for solving geodesic problems."
arch=('i686' 'x86_64' 'armv7h')
url="http://geographiclib.sourceforge.net/"
license=('MIT/X11')
depends=('python2')

source=(https://pypi.python.org/packages/source/g/geographiclib/${_pkgname}-${pkgver}.tar.gz)
md5sums=('f802ea9f3a78d823045670ff38d2ab25')

package() {
  cd "$srcdir"/${_pkgname}-${pkgver}
  python2 setup.py install --root="$pkgdir"
}
