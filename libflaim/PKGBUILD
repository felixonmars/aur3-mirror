# Maintainer: Jörg Rüppel <joerg@sharky-x.de>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Frane Bandov <frane@offbyte.com>

pkgname=libflaim
pkgver=4.9.845
pkgrel=1
license=('GPL')
pkgdesc="An embeddable cross-platform database engine"
arch=('x86 x86_64')
url="http://flaim.sourceforge.net"
depends=('gcc-libs-multilib' 'ncurses')
source=(http://downloads.sourceforge.net/project/flaim/stable/flaim/source/libflaim-$pkgver.tar.gz
	kybuild.patch
	ftk.patch
	disable-werror.patch
)
md5sums=('f719fe61584e9a2c2a2aede9a59cf5c1' 
	 '94e7e2cf1a9375e946fb63fd58ffdbbf' 
	 'b3c1bb3375fc6af3f4f21c83d7384a97'
	'159168954e3b3d85a2bc2de463153ff3'
)

build() {
  export host_os_family="linux"

  #Arch64 fix 
  if [ "$CARCH" = "x86_64" ]; then
     export HOSTTYPE="x86_64"
  else export HOSTTYPE="x86"
  fi

  cd $srcdir/libflaim-$pkgver

  patch -p0 -i ../kybuild.patch
  patch -p0 -i ../ftk.patch
  patch -p0 -i ../disable-werror.patch
  
  make || return 1
  make install_prefix=$pkgdir/usr install

  if [ "$CARCH" = "x86_64" ]; then
    mv $pkgdir/usr/lib64 $pkgdir/usr/lib
  fi

  sed -i -e 's/^prefix=.*/prefix=\/usr/g' $pkgdir/usr/lib/pkgconfig/libflaim.pc
  sed -i -e 's/lib64/lib/g' $pkgdir/usr/lib/pkgconfig/libflaim.pc

}
