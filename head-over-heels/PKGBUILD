# Maintainer: Laurent Carlier <lordheavym@gmail.com>

pkgname=head-over-heels
pkgver=1.0.1
pkgrel=1
pkgdesc="A remake of the game"
arch=('i686' 'x86_64')
url="http://headoverheels2.com"
license=('GPL3') # APACHE for xerces-c v2
depends=('allegro4' 'gcc-libs')
options=('!makeflags')
source=(http://www.headoverheels2.com/descargas/headoverheels-${pkgver}.tar.bz2
        http://ftp.heanet.ie/mirrors/www.apache.org/dist/xerces/c/2/sources/xerces-c-src_2_8_0.tar.gz
        headoverheels)
md5sums=('a37650adf40b77069036b8aacd5b88e1'
         '5daf514b73f3e0de9e3fce704387c0d2'
         'd38a7b6bc977f2acd6d2d492fc7a4e3e')

build() {
  msg "Building xercesc v2 library"

  # First we build an internal xerces-c v2 library
  export XERCESCROOT=${srcdir}/xerces-c-src_2_8_0
  cd ${srcdir}/xerces-c-src_2_8_0/src/xercesc
  ./runConfigure -plinux -cgcc -xg++ -minmem -nsocket -tnative -rpthread -P/usr
  make
  make DESTDIR=${pkgdir} install

  # Now we build headoverheels
  msg "Building now Head Over Heels!"

  cd ${srcdir}/headoverheels-${pkgver}

  ./configure --prefix=/usr CPPFLAGS="${CPPFLAGS} -I${pkgdir}/usr/include" \
    LDFLAGS="${LDFLAGS} -L${pkgdir}/usr/lib"
  make
}

package() {
  cd headoverheels-${pkgver}

  make DESTDIR=${pkgdir} install

  rm -r ${pkgdir}/usr/include
  mv ${pkgdir}/usr/lib ${pkgdir}/usr/share/headoverheels/lib
  mv ${pkgdir}/usr/bin/headoverheels ${pkgdir}/usr/bin/headoverheels-bin
  install -m755 ${srcdir}/headoverheels ${pkgdir}/usr/bin/headoverheels
}
