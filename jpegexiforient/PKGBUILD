# Maintainer: Eric Schulte <schulte.eric@gmail.com>

pkgname=jpegexiforient
pkgver=1
pkgrel=0
pkgdesc="This is a utility program to get and set the Exif Orientation Tag."
arch=('i686' 'x86_64')
depends=('')
source=(http://jpegclub.org/$pkgname.c)
md5sums=('9f604db3fd77b3549d5bbd6c6dc0952f')
url="http://jpegclub.org/$pkgname.c"
license=('?')

build() {
  cd ${srcdir}
  gcc $pkgname.c -o $pkgname
}

package(){
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/bin
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
