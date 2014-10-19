# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=watcom-p2c
pkgdesc="Pascal-to-C translator front-end to Open Watcom (multi-target cross compiler)"
groups=('watcom-linux' 'watcom-win32' 'watcom-win16' 'watcom-dos' 'watcom-os2' 'watcom-netware')
pkgver=1.21alpha2
pkgrel=3
arch=('any')
license=('GPL' 'LGPL')
depends=('open_watcom-v2' 'perl')
makedepends=('open_watcom-v2')
url="http://schneider.ncifcrf.gov/p2c/"
source=("http://schneider.ncifcrf.gov/p2c/p2c-1.21alpha2.tar.gz" "ow_p2cc" "pragma.patch")
options=(!strip !buildflags staticlibs emptydirs)
md5sums=('8340429ae80be2e0e82c01f70c0355bb' '08a2b1ee790b53922fd741a3e3349009' \
'c11e95a9ffaa3747d5e22b72bffeadd8')

prepare() {
  cd $srcdir/src
  
  cp Makefile Makefile.16
  cp Makefile Makefile.32

  msg "generic modifications of makefiles"
  sed 's|CC = cc|CC = owcc|g' -i Makefile.{16,32}
  sed 's|if \[ -f \/usr\/bin\/ranlib|#if \[ -f \/usr\/bin\/ranlib|g' -i Makefile.{16,32}
  sed 's|ar r |wlib -c -q -n -t |g' -i Makefile.{16,32}  
  sed 's|HOMEDIR = ..\/home|HOMEDIR = \/opt\/watcom\/p2c|g' -i Makefile.{16,32}
  sed 's|libp2c.a|libp2c.lib|g' -i Makefile.{16,32}
  sed 's|DEB = # -g|DEB = -zq|g' -i Makefile.{16,32}
  
  msg "16-bit specific modifications of makefile"
  sed 's|OPT = # -O|OPT = -O2|g' -i Makefile.16
  
  msg "32-bit specific modifications of makefile"
  sed 's|OPT = # -O|OPT = -O2|g' -i Makefile.32

}

build() {
  cd $srcdir/src 
  
  make -f Makefile makeproto
  make clean
  
  unset CFLAGS
  unset LDFLAGS
  
  source /opt/watcom/owsetenv.sh
  
  msg "building linux p2c compiler + library"
  export INCLUDE=$WATCOM/lh
  mkdir -p $srcdir/linux/{binl,{h,lh}/p2c,p2c,lib386/linux}
  cp Makefile.32 Makefile.linux
  sed 's|DEFS =|DEFS = -blinux|g' -i Makefile.linux
  sed 's|INCDIR = ..\/home\/p2c|INCDIR = \/opt\/watcom\/lh\/p2c|g' -i Makefile.linux
  sed 's|LIBDIR = ..\/home|LIBDIR = \/opt\/watcom\/lib386\/linux|g' -i Makefile.linux
  make -f Makefile.linux
  #prepend pragma library in header
  patch p2c.h < $srcdir/pragma.patch
  cp p2c.h $srcdir/linux/lh/p2c/
  cp p2c.h $srcdir/linux/h/p2c/
  cp libp2c.lib $srcdir/linux/lib386/linux/
  cp sys.p2crc p2crc
  cp {loc.p2crc,p2crc,string.pas,system.imp,system.m2,turbo.imp} $srcdir/linux/p2c/
  cp p2c $srcdir/linux/binl/
  make -f Makefile.linux clean
  rm -f *.{o,lib}
  
  msg "building 16 bit dos p2c library"
  mkdir -p $srcdir/dos/lib286/dos
  export INCLUDE=$WATCOM/h
  cp Makefile.16 Makefile.dos16
  sed 's|DEFS =|DEFS = -bdos|g' -i Makefile.dos16
  make -f Makefile.dos16 libp2c.lib
  cp libp2c.lib $srcdir/dos/lib286/dos/
  make -f Makefile.dos16 clean
  rm -f *.{o,lib}
  
  msg "building 32 bit dos p2c library"
  mkdir -p $srcdir/dos/lib386/dos
  export INCLUDE=$WATCOM/h
  cp Makefile.32 Makefile.dos32
  sed 's|DEFS =|DEFS = -bdos4g|g' -i Makefile.dos32
  make -f Makefile.dos32 libp2c.lib
  cp libp2c.lib $srcdir/dos/lib386/dos/
  make -f Makefile.dos32 clean
  rm -f *.{o,lib}
  
  msg "building win16 p2c library"
  mkdir -p $srcdir/win/lib286/win
  export INCLUDE=$WATCOM/h:$WATCOM/win
  cp Makefile.16 Makefile.win16
  sed 's|DEFS =|DEFS = -bwindows|g' -i Makefile.win16
  make -f Makefile.win16 libp2c.lib
  cp libp2c.lib $srcdir/win/lib286/win/
  make -f Makefile.win16 clean
  rm -f *.{o,lib}
  
  msg "building win32 p2c library"
  mkdir -p $srcdir/nt/lib386/nt
  export INCLUDE=$WATCOM/h:$WATCOM/nt
  cp Makefile.32 Makefile.win32
  sed 's|DEFS =|DEFS = -bt=nt|g' -i Makefile.win32
  make -f Makefile.win32 libp2c.lib
  cp libp2c.lib $srcdir/nt/lib386/nt/
  make -f Makefile.win32 clean
  rm -f *.{o,lib}
  
  msg "building 16 bit OS/2 p2c library"
  mkdir -p $srcdir/os2/lib286/os2
  export INCLUDE=$WATCOM/h:$WATCOM/os21x
  cp Makefile.16 Makefile.os21x
  sed 's|DEFS =|DEFS = -bos2|g' -i Makefile.os21x
  make -f Makefile.os21x libp2c.lib
  cp libp2c.lib $srcdir/os2/lib286/os2/
  make -f Makefile.os21x clean
  rm -f *.{o,lib}
  
  msg "building 32 bit OS/2 p2c library"
  mkdir -p $srcdir/os2/lib386/os2
  export INCLUDE=$WATCOM/h:$WATCOM/os2
  cp Makefile.32 Makefile.os2
  sed 's|DEFS =|DEFS = -bos2v2|g' -i Makefile.os2
  make -f Makefile.os2 libp2c.lib
  cp libp2c.lib $srcdir/os2/lib386/os2/
  make -f Makefile.os2 clean
  rm -f *.{o,lib}
  
  msg "buiding 32 bit netware p2c library"
  mkdir -p $srcdir/netware/lib386/netware
  export INCLUDE=$WATCOM/h
  cp Makefile.32 Makefile.netware
  sed 's|DEFS =|DEFS = -bnetware|g' -i Makefile.netware
  make -f Makefile.netware libp2c.lib
  cp libp2c.lib $srcdir/netware/lib386/netware/
  make -f Makefile.netware clean
  rm -f *.{o,lib}
 }

package() {
  cd $srcdir/
  mkdir -p ${pkgdir}${WATCOM}/{binl,lib286/{dos,win,os2},lib386/{dos,nt,os2,linux,netware},h,lh}
  for i in {dos,win,nt,linux,os2,netware}; do 
  cp -ar $i/* ${pkgdir}${WATCOM}/
  done
  install -m755 $srcdir/ow_p2cc ${pkgdir}${WATCOM}/binl/p2cc
  mkdir -p $pkgdir/usr/share/licenses/watcom/Linux/p2c
  install -m644 src/COPYING $pkgdir/usr/share/licenses/watcom/Linux/p2c/LICENSE
}

