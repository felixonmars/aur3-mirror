# Contributor: fila pruda.com

pkgname=dbview
pkgver=1.0.4
pkgrel=2
pkgdesc="A small utility that will display dBase III and IV files and can convert your old .dbf files."
arch=('i686' 'x86_64')
url="http://www.infodrom.org/projects/dbview/"
license=('GPL')
depends=('glibc')
source=(http://www.infodrom.org/projects/dbview/download/dbview-${pkgver}.tar.gz)
md5sums=('f77c9a85ca18dd1c80f72fcbc17c78ea')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  install -d -m 755 ${pkgdir}/usr/bin
  install -s -m 755 dbview ${pkgdir}/usr/bin
  install -d -m 755 ${pkgdir}/usr/share/man/man1
  install -m 644 dbview.1 ${pkgdir}/usr/share/man/man1
  
}
