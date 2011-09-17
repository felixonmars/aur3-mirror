# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=qmd5generator
_pkgname=QMd5Generator
pkgver=1.0.1
pkgrel=1
pkgdesc="Simple and useful MD5 has generator"
arch=('i686' 'x86_64')
url='http://qt-apps.org/content/show.php/QMD5Generator?content=145040'
license=('GPL')
depends=('qt')
source=("http://jkoder.dyndns.org/wp-content/uploads/downloads/2011/09/${_pkgname}.zip")
md5sums=('f0868dc6e286ebc51765a01d376466d0')

build() {
  cd "${srcdir}/${_pkgname}"
  qmake
  make 
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 ${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
} 
