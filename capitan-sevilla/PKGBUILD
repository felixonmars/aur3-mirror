# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=capitan-sevilla
pkgver=1.0.3
pkgrel=4
pkgdesc="A remake of the spanish game Capitan Sevilla"
arch=('i686' 'x86_64')
url="http://computeremuzone.com/ficha.php?id=754"
license=('GPL3')
depends=('allegro4' 'libpng' 'gcc-libs')
source=(http://computeremuzone.com:80/cezgs/remakes/Capitan.tar.bz2)
md5sums=('bf296048733c7e9136c414c2f57b3b3b')

build() {
  cd ${srcdir}/capitan-${pkgver}

  # change ./ to share dir
  sed -i 's/\.\//\/usr\/share\/'${pkgname}'\//g' ./src/hardware.cpp \
    ./src/messages.cpp ./src/presentacion.cpp ./src/sonido.cpp

  make depsclean && make deps
  make clean && make
}

package() {
  cd ${srcdir}/capitan-${pkgver}

  install -d ${pkgdir}/usr/share/${pkgname}/
  install -d ${pkgdir}/usr/bin/
  install -d ${pkgdir}/usr/share/applications/

  install -D capitan ${pkgdir}/usr/bin/
  cp -r data lang extra/instructions.pdf  ${pkgdir}/usr/share/${pkgname}/
  cat extra/capitan.desktop | \
    sed s#capitan.png#/usr/share/pixmaps/capitan.png#g > \
    ${pkgdir}/usr/share/applications/capitan.desktop
  install -D extra/capitan.png \
    ${pkgdir}/usr/share/pixmaps/capitan.png
}