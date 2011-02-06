# Contributor: rabyte <rabyte*gmail>

pkgname=xmms-sexyspc
pkgver=0.5.0
pkgrel=3
pkgdesc="An XMMS plugin for playing SNES sound files (SPC)"
arch=('i686' '!x86_64') # contains i386 assembly code!
url="http://sourceforge.net/projects/sexyspc/"
license=('GPL2')
depends=('xmms>=1.2.4')
makedepends=('nasm')
options=('!libtool')
source=(http://downloads.sourceforge.net/sexyspc/sexyspc-$pkgver.tar.gz \
	SNESAPU.diff)
md5sums=('c73c5bfec3fb59e64e6ac2c813cf0123'
         '0c4c5293b8e5dd98c3af259ddacee669')

build() {
  cd $srcdir/sexyspc-$pkgver

  patch -Np0 -i ../SNESAPU.diff || return 1

  ./configure --prefix=/usr --disable-static
  make AFLAGS="-O2 -f elf" || return 1
  make DESTDIR=$pkgdir install
}
