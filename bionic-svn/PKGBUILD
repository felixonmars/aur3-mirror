# Maintainer: Jens Staal <staal1978@gmail.com>
pkgname=bionic-svn
pkgver=2011.03.12
pkgrel=5
pkgdesc="The Android BSD-licenced lightweight Bionic libc, libm and libdl made into a stand-alone lib by the metasploit project"
arch=('i686')
url="https://www.metasploit.com/redmine/projects/framework/repository/show/external/source/meterpreter/source/bionic"
license=('custom:BSD')
makedepends=('subversion' 'ftjam')
source=('stdlibh.patch')
md5sums=('a27e1eb9a826eb73eb5f3ed0c626a9db')
provides=('bionic')

_svntrunk=https://www.metasploit.com/svn/framework3/trunk/external/source/meterpreter/source/bionic/

build() {

    svn co $_svntrunk

    rm -rf $srcdir/build
    cp -ar $srcdir/bionic $srcdir/build
    patch -p0 $srcdir/build/libc/include/stdlib.h $srcdir/stdlibh.patch # c++ compatibility stuff breaks compilations

#
# The build instructions taken from: https://bitbucket.org/jrossi/metasploit/src/7f4bdc5394ca/documentation/posix_meterpreter.txt
# compile bionic.a and libbionic.so
# This compilation requires header files from the libm directory

     cd $srcdir/build/libc/
     ARCH=x86 TOP=${PWD} jam || return 1
     cd out/x86/
     sh make.sh

# Compile bionic libm.so
#
     cd $srcdir/build/libm/
     make -f msfMakefile

# Install the bionic dynamic linker
     cd $srcdir/build/libdl/
     make
  }

package() {
# create package directories
    mkdir -m755 $pkgdir/usr/
    mkdir -m755 $pkgdir/usr/lib/
    mkdir -m755 $pkgdir/usr/lib/bionic/
    mkdir -m755 $pkgdir/usr/lib/bionic/libc/
    mkdir -m755 $pkgdir/usr/lib/bionic/libc/include/
    mkdir -m755 $pkgdir/usr/lib/bionic/libc/kernel/
    mkdir -m755 $pkgdir/usr/lib/bionic/libc/arch-x86/
    mkdir -m755 $pkgdir/usr/lib/bionic/libc/private/
    mkdir -m755 $pkgdir/usr/lib/bionic/libm/
    mkdir -m755 $pkgdir/usr/lib/bionic/libm/include/

# move package headers etc to /usr/lib/bionic directory

    cp -ar $srcdir/build/libc/include/* $pkgdir/usr/lib/bionic/libc/include
    cp -ar $srcdir/build/libc/kernel/* $pkgdir/usr/lib/bionic/libc/kernel    
    cp -ar $srcdir/build/libc/arch-x86/* $pkgdir/usr/lib/bionic/libc/arch-x86
    cp -ar $srcdir/build/libc/private/* $pkgdir/usr/lib/bionic/libc/private

    cp -ar $srcdir/build/libm/include/* $pkgdir/usr/lib/bionic/libm/include/

# move bionic libc binaries to /usr/lib/bionic, adding licences to an appropriate directory
    
    install -D -m0755 $srcdir/build/libc/out/x86/bionic.a $pkgdir/usr/lib/bionic/bionic.a
    install -D -m0755 $srcdir/build/libc/out/x86/libbionic.so $pkgdir/usr/lib/bionic/libbionic.so
    install -D -m0644 $srcdir/build/libc/MODULE_LICENSE_BSD $pkgdir/usr/share/licenses/bionic/libc/MODULE_LICENSE_BSD
    install -D -m0644 $srcdir/build/libc/NOTICE $pkgdir/usr/share/licenses/bionic/libc/NOTICE

# move bionic libm.so to /usr/lib/bionic, directory chosen in order not to conflict with others

     install -D -m0755 $srcdir/build/libm/libm.so $pkgdir/usr/lib/bionic/libm.so
     install -D -m0644 $srcdir/build/libm/MODULE_LICENSE_BSD_LIKE $pkgdir/usr/share/licenses/bionic/libm/MODULE_LICENSE_BSD_LIKE
     install -D -m0644 $srcdir/build/libm/NOTICE $pkgdir/usr/share/licenses/bionic/libm/NOTICE

# move bionic lidl.so to /usr/lib/bionic, directory chosen in order not to conflict with others

    install -D -m0755 $srcdir/build/libdl/libdl.so $pkgdir/usr/lib/bionic/libdl.so
    install -D -m0644 $srcdir/build/libdl/MODULE_LICENSE_BSD $pkgdir/usr/share/licenses/bionic/libdl/MODULE_LICENSE_BSD
    install -D -m0644 $srcdir/build/libdl/NOTICE $pkgdir/usr/share/licenses/bionic/libdl/NOTICE
}
