#Mantainer Jens Staal <staal1978@gmail.com>

pkgname=i386-plan9-apelibs
pkgver=1308

#the aim is to get the plan9 target support up-to-date
#the original target port was made by David Gordon Hogan
#For the original changes, next-of-kin of David need to be contacted.
#The original port can be found at:
#http://plan9.bell-labs.com/sources/extra/gcc/ape.tgz

pkgrel=1
_prefix=i386-lucent-plan9
_xpath=/opt/cross-i386-plan9/ape
pkgdesc="ANSI/POSIX compatible Plan9 libraries precompiled for the i386-plan9 target"
arch=(i686 x86_64)
license=(LPL)
options=('!libtool' '!distcc' '!ccache' '!strip')
url="http://plan9.bell-labs.com/sys/doc/ape.html"
depends=('i386-plan9-binutils')
source=(https://ports2plan9.googlecode.com/files/gcc45-apelibs-08.2013.tbz)


md5sums=('c109a106a73c20ca2c69e05c0c9da1ba')

build() {

  msg "nothing to build, we use the pre-compiled (gcc-3.0 on Plan9 host) libraries"
  msg2 "building apelibs from source requires mk and some path fiddling"
  
}

package() {
  cd $srcdir
  mkdir -p ${pkgdir}/${_xpath}/{lib,include/{arpa,netinet,sys}}
  install -m644 ${srcdir}/386/lib/gnu/* ${pkgdir}/${_xpath}/lib/
  install -m644 ${srcdir}/386/include/gnu/* ${pkgdir}/${_xpath}/include/
  install -m644 ${srcdir}/sys/include/gnu/*.h ${pkgdir}/${_xpath}/include/
  install -m644 ${srcdir}/sys/include/gnu/arpa/*.h ${pkgdir}/${_xpath}/include/arpa/
  install -m644 ${srcdir}/sys/include/gnu/netinet/*.h ${pkgdir}/${_xpath}/include/netinet/
  install -m644 ${srcdir}/sys/include/gnu/sys/*.h ${pkgdir}/${_xpath}/include/sys/
      
    msg "Done! (hopefully)"

} 
