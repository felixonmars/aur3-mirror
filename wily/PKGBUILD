# Contributor: Benjamin Jorand <benjamin.jorand@gmail.com>
# Maintainer: Christian Neukirchen <chneukirchen@gmail.com>
pkgname=wily
pkgver=0.13.42
pkgrel=6
arch=('i686' 'x86_64' 'arm')
pkgdesc="A mouse-oriented, text-based working environment for programmers"
url="http://www.cs.yorku.ca/~oz/wily/"
license=('BSD')
depends=('libxt')
source=(ftp://ftp.cs.yorku.ca/pub/wily/src/$pkgname-$pkgver.tar.gz wily-scrollwheel.patch)
md5sums=('0a1908eaa957c87dfe82e506ff314160'
	'b44a48cfb338c2ae72ad5451c59a3ddd')

build() {
  cd ${srcdir}/$pkgname-$pkgver
  patch -p1 <${srcdir}/wily-scrollwheel.patch
  autoreconf
  ./configure --prefix=/usr

  sed -i 's:"fixed":"-misc-fixed-medium-r-semicondensed--0-0-75-75-c-0-iso10646-1":' libXg/xtbinit.c

  make

  cd tools/win
  sed -i 's:/bin/test:test:' configure
  sh ./configure --prefix=/usr

  sed -i 's:-I..:-I../.. -I../../include:' Makefile  
  sed -i 's:../libmsg/libmsg.a:../&:' Makefile  
  sed -i 's:../sam/libXg/libXg.a:../../libXg/libXg.a:' Makefile  
  sed -i 's:-lsocket ::g' Makefile

  sed -i 's: " in " __FUNCTION__ "()"::' *.c

  make
  
  cd ../quanstro
  
  sed -i 's:sys/limits.h:limits.h:' *.c
  sed -i '/rpc_new/s:filename, &id):filename, \&id, 1):' wcat.c
  sed -i '/rpc_new/s:winname, &id):winname, \&id, 0):' wcat.c
  sed -i 's:exits:Exits:g' wread.c
  
  for f in windows wcat wread wreplace; do
    gcc -O2 -o $f $f.c  -I../../include -L../../libmsg -I../.. -lmsg
  done
}

package() {
  cd ${srcdir}/$pkgname-$pkgver
  install -D -m755 wily/wily "${pkgdir}/usr/bin/wily"
  install -D -m644 README "${pkgdir}/usr/share/licenses/${pkgname}/README"

  cd tools/win
  install -D -m755 wgoto "${pkgdir}/usr/bin/wgoto"
  install -D -m755 win "${pkgdir}/usr/bin/win"
  
  cd ../quanstro
  install -D -m755 wcat "${pkgdir}/usr/bin/wcat"
  install -D -m755 windows "${pkgdir}/usr/bin/wins"
  install -D -m755 wread "${pkgdir}/usr/bin/wread"
  install -D -m755 wreplace "${pkgdir}/usr/bin/wreplace"
}
