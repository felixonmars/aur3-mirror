# Maintainer: Erol Grahm <erol at grahm dot nu>

pkgname=libpng-old
pkgver=1.0.2
pkgrel=2
pkgdesc="A collection of routines used to create PNG format graphics files, builds libpng.3, libpngpf.3 and libpng.so.2 (libpng.so.2.1.0.2)"
arch=('i686' 'x86_64')
url="http://www.libpng.org/pub/png/libpng.html"
license=('Open Source')
depends=('zlib')
source=(http://downloads.sourceforge.net/sourceforge/libpng/libpng-$pkgver.tar.gz)
md5sums=('a8b093154f07f7b82e5c9bb77c11a0c4')

build() {
  install -d $pkgdir/usr/lib
  cd "$srcdir/libpng-$pkgver"
  cp $srcdir/libpng-$pkgver/scripts/makefile.lnx $srcdir/libpng-$pkgver/makefile
  make || return 1
  cp -r $srcdir/libpng-$pkgver/* $pkgdir/usr/lib
  chmod -R 644 $srcdir/libpng-$pkgver/{scripts/,makefile}
  chmod -R 644 $pkgdir/usr/lib/{ANNOUNCE,ansi2knr.1,ansi2knr.c,CHANGES,example.c,INSTALL,KNOWNBUG,libpng.a,libpng.so,libpng.txt,makefile,png.5,png.c,pngconf.h,pngerror.c,pngerror.o,pngerror.pic.o,pngget.c,pngget.o,pngget.pic.o,png.h,pngmem.c,pngmem.o,pngmem.pic.o,png.o,png.pic.o,pngpread.c,pngpread.o,pngpread.pic.o,pngread.c,pngread.o,pngread.pic.o,pngrio.c,pngrio.o,pngrio.pic.o,pngrtran.c,pngrtran.o,pngrtran.pic.o,pngrutil.c,pngrutil.o,pngrutil.pic.o,pngset.c,pngset.o,pngset.pic.o,pngtest,pngtest.c,pngtest.o,pngtest.png,pngtrans.c,pngtrans.o,pngtrans.pic.o,pngwio.c,pngwio.o,pngwio.pic.o,pngwrite.c,pngwrite.o,pngwrite.pic.o,pngwtran.c,pngwtran.o,pngwtran.pic.o,pngwutil.c,pngwutil.o,pngwutil.pic.o,README,scripts,TODO}
  rm -r $pkgdir/usr/lib/{ANNOUNCE,ansi2knr.1,ansi2knr.c,CHANGES,example.c,INSTALL,KNOWNBUG,libpng.a,libpng.so,libpng.txt,makefile,png.5,png.c,pngconf.h,pngerror.c,pngerror.o,pngerror.pic.o,pngget.c,pngget.o,pngget.pic.o,png.h,pngmem.c,pngmem.o,pngmem.pic.o,png.o,png.pic.o,pngpread.c,pngpread.o,pngpread.pic.o,pngread.c,pngread.o,pngread.pic.o,pngrio.c,pngrio.o,pngrio.pic.o,pngrtran.c,pngrtran.o,pngrtran.pic.o,pngrutil.c,pngrutil.o,pngrutil.pic.o,pngset.c,pngset.o,pngset.pic.o,pngtest,pngtest.c,pngtest.o,pngtest.png,pngtrans.c,pngtrans.o,pngtrans.pic.o,pngwio.c,pngwio.o,pngwio.pic.o,pngwrite.c,pngwrite.o,pngwrite.pic.o,pngwtran.c,pngwtran.o,pngwtran.pic.o,pngwutil.c,pngwutil.o,pngwutil.pic.o,README,scripts,TODO}
  chmod 755 $pkgdir/usr/lib/libpng.so.2.1.0.2
}
