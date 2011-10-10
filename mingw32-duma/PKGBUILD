# Maintainer: Alexandre Bique <bique.alexandre@gmail.com>
# Contributor: revel <revelΘmuub·net>
# Contributor: tmm1 <archΘtmm1·net>

_pkgname=duma
pkgname=mingw32-${_pkgname}
pkgver=2.5.15
pkgrel=1
pkgdesc="Multi-platform memory debugging library (Detect Unintended Memory Access) (mingw32)"
arch=('any')
url="http://duma.sourceforge.net/"
license=('GPL')
depends=()
_pkgver=`echo ${pkgver} | tr . _`
source=("http://voxel.dl.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}_${_pkgver}.tar.gz"
        fix-missing-include.patch
        duma_config.h)
options=('!strip' '!libtool')

DUMA_MAKE_OPTIONS="OSTYPE=msys CC=i486-mingw32-gcc CXX=i486-mingw32-g++ AR=i486-mingw32-ar RANLIB=i486-mingw32-ranlib"

build() {
  unset LDFLAGS
  cd $srcdir/${_pkgname}_${_pkgver}
  patch -p0 <../fix-missing-include.patch
  cp ../duma_config.h .
  make ${DUMA_MAKE_OPTIONS} libduma.a
}

package() {
  cd $srcdir/duma_${_pkgver}
  install -dm755 $pkgdir/usr/i486-mingw32/{include,lib}
  install -m644 duma{_hlp,_config,_sem,}.h noduma.h $pkgdir/usr/i486-mingw32/include
  install -m644 libduma.a $pkgdir/usr/i486-mingw32/lib
}

md5sums=('fe630c69cbaa39caf225a3d9ed2fda1f'
         '149bf13380764c680c8a1880051837b6'
         'f4a159627cdd9ca114cbffff3657d33a')
