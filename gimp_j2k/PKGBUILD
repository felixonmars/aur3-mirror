# Maintainer: kfgz <kfgz at interia pl>

pkgname=gimp_j2k
pkgver=0.0.1
pkgrel=1
pkgdesc="Adds JPEG 2000 support to GIMP"
arch=('i686' 'x86_64')
url="http://advance-software.com/"
license=('GPL')
depends=('gimp' 'openjpeg')
source=(http://advance-software.com/download/tools/gimp_j2k.zip)
md5sums=('13b11ebbc89f6cfef3eaa25836e7a1ae')

build() {
  cd "${srcdir}"/${pkgname}
  ./configure --prefix="${pkgdir}"/usr
  make
}

package() {
  cd "${srcdir}"/${pkgname}
  make DESTDIR="${pkgdir}" install-exec-recursive
}
