#Mantainer Jens Staal <staal1978@gmail.com>

pkgname=i386-plan9-binutils
pkgver=2.22

#the aim is to get the plan9 target support up-to-date
#the original target port (version 2.11.2) was made by David Gordon Hogan
#My own changes are free for FSF to  integrate in the official binutils with implicit copyright transfer
#For the original changes, next-of-kin of David need to be contacted.
#The original port can be found at:
#http://plan9.bell-labs.com/sources/extra/gcc/gnusrc.tgz

pkgrel=1
_prefix=i386-lucent-plan9
_xpath=/opt/cross-i386-plan9
pkgdesc="A set of programs to assemble and manipulate binary and object files -modified for i386-plan9 target"
arch=(i686 x86_64)
license=(GPL)
options=('!libtool' '!distcc' '!ccache')
url="http://sources.redhat.com/binutils"
depends=('glibc' 'zlib')
source=(https://ports2plan9.googlecode.com/files/plan9-binutils-${pkgver}.tar.bz2)

md5sums=('0fa70bcaf91df4c97050d01759f445e2')

prepare(){
  cd $srcdir/binutils-${pkgver}

  make clean
  #make distclean || return 0
  #suppress some weird error
  for i in {bfd,binutils,etc,gas,gprof,intl,ld,libiberty,opcodes}
    do   
      rm -f $i/config.{status,h,cache,log}
      rm -f $i/Makefile
      msg "$i cleaned"
    done

  rm -f $srcdir/binutils-${pkgver}/bfd/bfd_stdint.h
  
  rm -rf $srcdir/binutils-build
  mkdir -p $srcdir/binutils-build
  cd $srcdir/binutils-build

  $srcdir/binutils-${pkgver}/configure --prefix=${_xpath} \
  --exec-prefix=${_xpath} --bindir=${_xpath}/bin \
  --includedir=${_xpath}/include --target=i386-lucent-plan9 \
  --disable-shared --enable-multilib --disable-nls --host=${CHOST} \
  --build=${CHOST} --with-sysroot=${_xpath} --enable-werror=no
}

build() {
  cd $srcdir/binutils-build

   make configure-host

   make tooldir=${_xpath}
}

package() {
  cd $srcdir/binutils-build
  
  make DESTDIR=${pkgdir} install
} 
