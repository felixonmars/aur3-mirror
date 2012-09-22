# Maintainer: Peter Lewis <plewis@aur.archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jesse Juhani Jaara <jesse.jaara@gmail.com>

pkgname=libx32-libmikmod
pkgver=3.1.12
pkgrel=6.1
pkgdesc="A portable sound library"
license=('GPL' 'LGPL')
url="http://sourceforge.net/projects/mikmod/"
arch=('x86_64')
depends=('libmikmod' 'libx32-glibc')
makedepends=('gcc-multilib-x32')
options=('!libtool')
install=
source=(http://downloads.sourceforge.net/mikmod/libmikmod-${pkgver}.tar.gz
        libmikmod-3.1.12-64bit-fix.diff
	libmikmod-3.1.12-exitcrash-fix.diff
	libmikmod-3.1.12-loopingvolume-fix.diff
	libmikmod-3.1.12-md_sngchn-fix.diff
        libmikmod-CVE-2009-0179.patch)
md5sums=('9f3c740298260d5f88981fc0d51f6f16'
         '2d5990bd2161950c9a83f24f13b11a50'
         '03a4f5bfcecddf5f515672d6d477b7f7'
         'a837fd876cbd2ac27419b802504489db'
         '076d39de19de36b880ed90297f1ee0d1'
         'fa91f4bc17164be32bec0ea7a73f2aaa')

build() {
  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  cd $srcdir/libmikmod-$pkgver

  # patches from sdl_mixer-1.2.11 source
  patch -Np1 -i $srcdir/libmikmod-3.1.12-64bit-fix.diff
  patch -Np1 -i $srcdir/libmikmod-3.1.12-exitcrash-fix.diff
  patch -Np1 -i $srcdir/libmikmod-3.1.12-loopingvolume-fix.diff
  patch -Np1 -i $srcdir/libmikmod-3.1.12-md_sngchn-fix.diff
  patch -Np1 -i $srcdir/libmikmod-CVE-2009-0179.patch

  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --libdir=/usr/libx32
  make
}

package() {
  cd $srcdir/libmikmod-$pkgver
  make DESTDIR=$pkgdir install
  rm -rf "${pkgdir}"/usr/{include,share,bin}
}

