# Contributor: Ray Rashif <schivmeister@gmail.com>

pkgname=olpcsound
_pkgname=Csound
pkgver=5.10.1
pkgrel=1
pkgdesc="Sound synthesis programming language (OLPC subset)"
arch=(i686 x86_64)
url="http://csound.sourceforge.net/"
license=('LGPL')
depends=('liblo' 'libpng' 'libsndfile' 'libvorbis' 'python')
makedepends=('scons' 'swig')
conflicts=('csound') # it does NOT provide, since this is an OLPC "spin" of the same code
source=(http://downloads.sourceforge.net/csound/$_pkgname$pkgver.tar.gz
	sugar-csound-64bit.patch
	sugar-csound-bad-symbols.patch)

build() {
  cd "$srcdir/$_pkgname$pkgver"

  # add x86_64 patch
  patch -Np1 -i ../sugar-csound-64bit.patch || return 1
  
  # add symbol patch
  patch -Np1 -i ../sugar-csound-bad-symbols.patch || return 1

  # prepare build environment
  [ "$CARCH" = "x86_64" ] && x86_64flags="Word64=1 Lib64=1"

  scons customCCFLAFS="$CFLAGS -D_GNU_SOURC" \
  	customCXXFLAGS="$CFLAGS -D_GNU_SOURCE" \
	buildOLPC=1 \
	useJack=0 \
	gcc3opt=0 \
	gcc4opt=0 \
	$x86_64flags || return 1

 python install-olpc.py	--prefix=/usr \
 			--install-python \
			--install-headers \
			--instdir="$pkgdir/" \
			--libdir=/usr/lib
}
md5sums=('7b2f4b4eb6ccab66e06625cb5377d4f7'
         '8728d3a33ff2a9164c25db676127d867'
         'cc28d264e692fe1caa37fab14f467acc')
