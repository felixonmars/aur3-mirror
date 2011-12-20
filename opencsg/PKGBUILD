pkgname=opencsg
pkgver=1.3.2
pkgrel=1
pkgdesc="OpenCSG is a library that does image-based CSG rendering using OpenGL."
arch=('i686' 'x86_64')
license=('GPLv2')
depends=('glew' 'glut')
url="http://www.opencsg.org"
source=(http://www.opencsg.org/OpenCSG-${pkgver}.tar.gz)

build() {
  cd -- "${srcdir}/OpenCSG-${pkgver}"
  make
}

package() {
  cd -- "${srcdir}/OpenCSG-${pkgver}"
  install -D lib/libopencsg.so.${pkgver} "$pkgdir"/usr/lib/libopencsg.so.${pkgver}
  install -D include/opencsg.h $pkgdir/usr/include/opencsg.h
  cd "$pkgdir"/usr/lib/
  ln -s libopencsg.so.${pkgver} libopencsg.so.1.3
  ln -s libopencsg.so.${pkgver} libopencsg.so.1
  ln -s libopencsg.so.${pkgver} libopencsg.so
}

sha1sums=('e2b4abf169ae3e319eb5f6d9ae6136fa96710a05')
