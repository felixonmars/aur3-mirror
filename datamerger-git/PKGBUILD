# Maintainer: foalsrock <foalsrock at gmail dot com>

pkgname=datamerger-git
pkgver=v1.0.4.r0.ge80578d
pkgrel=1
pkgdesc="An application that offers robust merging of spreadsheets."
arch=(any)
url="https://github.com/dschreij/Datamerger"
license=('GPL2')
depends=('python2' 'python2-xlrd' 'python2-xlwt' 'python2-openpyxl' 'python2-pyqt4')
source=("git://github.com/dschreij/Datamerger")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/Datamerger"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/Datamerger"
  python2 setup.py install --root="${pkgdir}/"
}
