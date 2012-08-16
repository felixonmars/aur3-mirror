# Maintainer: Matthew 'Zashi' Hiles <zashi@vay8.net>

pkgname=mspgcc-gdb
pkgver=20120406
pkgrel=1
pkgdesc="GNU Debug for the MSP430 family of microcontrollers"
arch=('i686' 'x86_64')
url="http://mspgcc.sf.net"
license=('GPL')
groups=()
depends=('zlib')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' '!libtool')
install=
_gdb='7.2'
_gdb_patch=20111205
source=("http://surfnet.dl.sourceforge.net/project/mspgcc/mspgcc/mspgcc-$pkgver.tar.bz2" "http://ftp.gnu.org/gnu/gdb/gdb-${_gdb}a.tar.bz2")
noextract=()
md5sums=('66a729487c2649a732b516dbe473f298'
         'ae6c7c98de35dc14b6720c9c321e4d94')
build() {
  cd "$srcdir"

  #
  # EXTRACT HERE
  #

  tar jxf mspgcc-$pkgver.tar.bz2
  tar jxf gdb-${_gdb}a.tar.bz2

  #
  # PATCH HERE
  #
  
  cd gdb-${_gdb}
  patch -p1 < ../mspgcc-${pkgver}/msp430-gdb-${_gdb}a-${_gdb_patch}.patch

  #
  # BUILD HERE
  #
  ./configure \
      --prefix=/usr \
      --program-prefix="msp430-" \
      --disable-multilib \
      --disable-nls \
      --enable-install-libbfd \
      --infodir=/usr/share/info \
      --libdir=/usr/lib \
      --mandir=/usr/share/man \
      --target=msp430
  make configure-host
  make tooldir=/usr all
}

package() {
  cd "$srcdir/gdb-${_gdb%a}"
  make DESTDIR=${pkgdir} tooldir=/usr install

  cd ${pkgdir}
  for i in usr/i686-pc-linux-gnu/msp430/include/ansidecl.h  usr/i686-pc-linux-gnu/msp430/include/bfd.h  usr/i686-pc-linux-gnu/msp430/include/bfdlink.h  usr/i686-pc-linux-gnu/msp430/include/dis-asm.h  usr/i686-pc-linux-gnu/msp430/include/symcat.h  usr/i686-pc-linux-gnu/msp430/lib/libbfd.a  usr/i686-pc-linux-gnu/msp430/lib/libopcodes.a  usr/lib/libiberty.a usr/share/info/bfd.info* usr/share/info/configure.info* usr/share/info/standards.info*; do
 rm -f "$i";
 done


}

