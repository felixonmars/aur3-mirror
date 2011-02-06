# Maintainer: perlawk

pkgname=mgrx
pkgver=1.00
_pkgver=100
pkgrel=1
pkgdesc="MGRX is a 2D graphics C library derived from the GRX library. GRX was
originaly written by Csaba Biegl for DJ Delorie's DOS port of the GCC
compiler."
arch=('i686' 'x86_64')
license=('GPL' 'LGPL')
url="http://www.fgrim.com/mgrx/"
depends=()
makedepends=('')
options=()
build() {
  cd ${srcdir}/${pkgname}${_pkgver}
  cp ${startdir}/patch.* .
  if [ `uname -m` == 'x86_64' ]; then
	  patch makedefs.grx < patch.64
  else
	  patch makedefs.grx < patch.32
  fi

  patch src/makefile.x11 < patch.x11
  
  make -j4 -f makefile.x11 || return 1

  mkdir -p $pkgdir/usr/{bin,lib,include,share/mgrx/fonts}
  install -m755 bin/*2c bin/xmodetest $pkgdir/usr/bin/
  install -m755 lib/unix/*a lib/unix/libmgrxX.so.0.1.0 $pkgdir/usr/lib/
  install -m755 fonts/* $pkgdir/usr/share/mgrx/fonts
  install -m755 include/* $pkgdir/usr/include
  cd $pkgdir/usr/lib
  ln -s libmgrxX.so.0.1.0 libmgrxX.so 
}
source=( "http://www.fgrim.com/mgrx/zfiles/$pkgname${_pkgver}.tar.gz"
	patch.64 patch.32 patch.x11)
md5sums=( b80ac0a024c166a116dee07cfd590f50
d1c7659abe97b32f3b8eeecaa552f66b 
9985cca7ce4b8d0408707e188f4aace4
66c4990927a2c79d0985641fcbb95c54)
