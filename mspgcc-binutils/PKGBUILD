# Maintainer: Matthew 'Zashi' Hiles <zashi@vay8.net>

pkgname=mspgcc-binutils
pkgver=20120406
pkgrel=1
pkgdesc="binutils suite for the MSP430 family of microcontrollers"
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
_binutils='2.21.1a'
source=("http://surfnet.dl.sourceforge.net/project/mspgcc/mspgcc/mspgcc-$pkgver.tar.bz2" "http://ftp.gnu.org/gnu/binutils/binutils-${_binutils}.tar.bz2")
noextract=()
md5sums=('66a729487c2649a732b516dbe473f298'
         'bde820eac53fa3a8d8696667418557ad')

build() {
  cd "$srcdir"

  #
  # EXTRACT HERE
  #

  tar jxf mspgcc-$pkgver.tar.bz2
  tar jxf binutils-${_binutils}.tar.bz2

  #
  # PATCH HERE
  #
  
  cd binutils-${_binutils%a}
  patch -p1 < ../mspgcc-${pkgver}/msp430-binutils-${_binutils}-${pkgver}.patch

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
  cd "$srcdir/binutils-${_binutils%a}"
  make DESTDIR=${pkgdir} tooldir=/usr install

  rm -f ${pkgdir}/usr/lib/libiberty.a
  rm -f ${pkgdir}/usr/man/man1/{dlltool,nlmconv,windres}*
  rm -f ${pkgdir}/usr/share/info/dir

  cd ${pkgdir}/usr/share/info
  for file in as bfd binutils configure gprof ld standards ; do
    mv ${file}.info "msp430-${file}.info"
  done

  for bin in addr2line ar as c++filt gprof ld nm objcopy \
             objdump ranlib readelf size strings strip
  do
    rm -f ${pkgdir}/usr/bin/${bin}
  done

  _docdir=${pkgdir}/usr/share/doc/${pkgname}
  #install -Dm644 ${srcdir}/README-msp430-binutils.txt ${_docdir}/README-msp430-binutils.txt
  #install -Dm644 ${srcdir}/binutils-${pkgver}/COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # rm -fr ${_builddir}
}

