# Contributor: fettouhi/Andre Fettouhi <A.Fettouhi@gmail.com>
# Maintainer: fettouhi/Andre Fettouhi <A.Fettouhi@gmail.com>

pkgname=openoffice-uglyfix-freetype2-infinality
pkgver=2.4.6
pkgrel=1
pkgdesc="Compiles freetype2 .so files and puts them in the openoffice directory to fix font ugliness"
arch=(i686 x86_64)
license=('GPL')
url="http://freetype.sourceforge.net"
depends=('zlib' 'openoffice-base')
options=('!libtool')
source=(http://downloads.sourceforge.net/sourceforge/freetype/freetype-${pkgver}.tar.bz2
	http://www.infinality.net/files/freetype-add-subpixel-hinting-infinality-20110604-1.patch
	http://www.infinality.net/files/freetype-enable-subpixel-hinting-infinality-20100909-1.patch
	http://www.infinality.net/files/freetype-entire-infinality-patchset-20110604-1.patch
	freetype-2.2.1-enable-valid.patch
	openoffice.patch)
md5sums=('5e6510613f612809d2d7862592b92ab7'
         'ded8954240034a1e6ab2b2115b3ddb8f'
         'a88b1a66da44a90c1fdcdeaa39a2dc09'
         'c3428e393be31d8e4089452135b1ae46'
         '214119610444c9b02766ccee5e220680'
         'c9ff451346b5f542479828df875e1d39')

build() {
  cd ${srcdir}/freetype-${pkgver}
  patch -Np1 -i ${srcdir}/freetype-add-subpixel-hinting-infinality-20110604-1.patch || return 1
  patch -Np1 -i ${srcdir}/freetype-2.2.1-enable-valid.patch || return 1
  patch -Np1 -i ${srcdir}/freetype-enable-subpixel-hinting-infinality-20100909-1.patch || return 1
  patch -Np1 -i ${srcdir}/freetype-entire-infinality-patchset-20110604-1.patch || return 1
  patch -Np0 -i ${srcdir}/openoffice.patch || return 1
  
  # Defining installation diectory for openoffice:
	INSTDIR=openoffice.org/basis3.3

  ./configure --prefix=/usr --with-bytecode_interpreter --with-subpixel_rendering --disable-static || return 1
  make || return 1
  make DESTDIR=${startdir}/pkg install || return 1
  mkdir -p ${pkgdir}/usr/lib/${INSTDIR}/program
  /bin/install -c ${startdir}/pkg/usr/lib/libfreetype.so* ${pkgdir}/usr/lib/${INSTDIR}/program/
  rm -rf ${pkgdir}/usr/{bin,include,share}
  rm -rf ${pkgdir}/usr/lib/{pkgconfig,libfreetype.so,libfreetype.so.6,libfreetype.so.6.7.1}
 }
