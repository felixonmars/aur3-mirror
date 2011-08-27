# Maintainer:  SpepS <dreamspepser at yahoo dot it>
# Contributor: Christoph Siegenthaler < csi@gmx.ch >
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>

pkgname=taopm
pkgver=1.0_beta_10May2006
_pkgver=1.0-beta-10May2006
pkgrel=7
pkgdesc="A software package for sound synthesis using physical models"
arch=('i686' 'x86_64')
options=('!libtool')
url="http://taopm.sourceforge.net/"
license=('GPL')
depends=('freeglut' 'audiofile')
source=(http://downloads.sourceforge.net/sourceforge/${pkgname}/tao-${_pkgver}.tar.gz)
md5sums=('0a84a61c0a20bcdcf73beed72434d07a')

build(){

  cd ${startdir}/src/tao-${_pkgver}

  # Gcc patches
  sed '21i #include <cstdio>' -i libtao/Tao.cc || return 1
  sed '23i #include "string.h"' -i libtao/TaoDevice.cc || return 1
  sed -e '31i #include "string.h"' \
      -e '31i #include <cstdio>' -i libtao/TaoGraphicsEngine.cc || return 1
  sed '26i #include "string.h"' -i libtao/TaoInstrument.cc || return 1
  sed '27i #include "string.h"' -i libtao/TaoOutput.cc || return 1
  sed '33i #include "string.h"' -i libtao/TaoPitch.cc || return 1
  sed -e '24i #include "string.h"' \
      -e '24i #include <cstdio>' -i taoparse/taoparser.yy || return 1
  sed -e '28i #include "string.h"' \
      -e '28i #include <cstdlib>' -i tao2aiff/tao2aiff.cc || return 1
  sed -e '28i #include "string.h"' \
      -e '28i #include <cstdlib>' -i tao2wav/tao2wav.cc || return 1

  sed 's_-shared -nostdlib_-fPIC -shared -nostdlib_g' -i configure || return 1
  sed 's_-shared -nostdlib_-fPIC -shared -nostdlib_g' -i aclocal.m4 || return 1
  sed 's_TAODIR=`pwd`_TAODIR="/usr/lib"_g' -i configure || return 1

  ./configure --prefix=/usr --libdir=/usr/lib --x-libraries=/usr/lib || return 1

  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Copying other files
  mkdir -p ${pkgdir}/usr/share/taopm/examples
  mkdir -p ${pkgdir}/usr/include
  cp -a examples/*.tao ${pkgdir}/usr/share/taopm/examples
  cp -a include/*.h ${pkgdir}/usr/include
}
