# Contributor:	woelfchen <wwilke@genion.de>
# Contributor:	Mautz
# Maintainer:	Wintershade <Wintershade[no_spam]<AT>[no_spam]gmail<DOT>com>

arch=('i686' 'x86_64')
pkgname=aacgain
pkgver=1.8
pkgrel=1
pkgdesc="Adjusts the volume of music files (mp4/m4a/QT/mp3) using ReplayGain algorithm."
url="http://altosdesign.com/aacgain"
license=('GPL')
install=
source=(http://altosdesign.com/aacgain/alvarez/aacgain-$pkgver.tar.bz2 \
	aacgain-1.8+glibc-2.10.patch)
md5sums=('61ce9e648fa1773adb3d4b3c84c6e4ca'
	 '8e4b094b2c863cd481325f96bc04d1d9')


build() {
  cd $startdir/src/$pkgname-$pkgver
  patch -p1 -i ../aacgain-1.8+glibc-2.10.patch
  ./configure --prefix=/usr || return 1
  sed -i -e "s:lrintf:_lrintf:g" faad2/libfaad/{common.h,lt_predict.c,output.c}
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  make prefix=$startdir/pkg/usr install
}
