# Maintainer: Matthew 'Zashi' Hiles <zashi at vay8 dot net>

# These PKGBUILD files are the results of scraping together several other
# PKGBUILD examples and other's work. 

pkgname=mspgcc-mspgcc
pkgver=20120406
pkgrel=1
pkgdesc="GNU GCC for MSP430 family of microcontrollers"
arch=('i686' 'x86_64')
url="http://mspgcc.sf.net"
license=('GPL')
groups=()
depends=('mspgcc-binutils')
makedepends=()
provides=()
conflicts=('gcc-msp430')
replaces=()
backup=()
options=('!emptydirs' '!libtool' '!strip')
install=


_patch_version=$pkgver
_gnumirror="http://ftpmirror.gnu.org"
_gcc_version=4.6.3

source=("http://surfnet.dl.sourceforge.net/project/mspgcc/mspgcc/mspgcc-$pkgver.tar.bz2" "${_gnumirror}/gcc/gcc-${_gcc_version}/gcc-${_gcc_version}.tar.bz2")
noextract=()
md5sums=('66a729487c2649a732b516dbe473f298'
         '773092fe5194353b02bb0110052a972e')

build() {
  cd "$srcdir"

  cd gcc-${_gcc_version}
  patch -p1 < "${srcdir}/mspgcc-${pkgver}/msp430-gcc-${_gcc_version}-${_patch_version}.patch"

  mkdir build  
  cd build
  
  msg "Starting make..."
  
  export CFLAGS="-O2 -pipe"
  export CXXFLAGS="-O2 -pipe"

  #
  # BUILD HERE
  #
  ../configure	\
				--disable-shared \
				--disable-libssp \
				--disable-nls \
				--target=msp430 \
				--enable-languages=c,c++ \
				--infodir=/usr/share/info \
				--libdir=/usr/lib \
				--libexecdir=/usr/lib \
				--mandir=/usr/share/man \
				--prefix=/usr \
				--with-gnu-as \
				--with-gnu-ld \
				--with-as=/usr/bin/msp430-as \
				--with-ld=/usr/bin/msp430-ld \
				--with-pkgversion="MSPGCC-GIT-UNIARCH"
  make -j5
}

package() {
  msg "Begin packaging"

  cd ${srcdir}/gcc-${_gcc_version}/build
  make DESTDIR=${pkgdir} install

  rm -f ${pkgdir}/usr/lib/libiberty.a
  rm -rf ${pkgdir}/usr/share/man/man7
  rm -rf ${pkgdir}/usr/share/info

  _docdir=${pkgdir}/usr/share/doc/${pkgname}

  msg "Stripping debugging symbols from binaries"
  local binary
  find ${pkgdir} -type f 2>/dev/null | while read binary ; do
    case "$(file -biz "$binary")" in
      *compressed-encoding*)      # Skip compressed binarys
        ;;
      *application/x-executable*) # Binaries
        /usr/bin/strip "$binary" >/dev/null 2>&1 ;;
    esac
  done
}
