# Maintainer: Matthew 'Zashi' Hiles <zashi at vay8 dot net>

# the uniarch packages for arch that build from git are just adapations
# of the excellent work done by Rick W. Chen <stuffcorpse at archlinux dot us>

pkgname=mspgcc-msp430mcu
pkgver=20120407
pkgrel=1
pkgdesc="C headers and binutils linker scripts for MSP430 family microcontrollers."
arch=('i686' 'x86_64')
url="http://mspgcc.sf.net"
license=('GPL')
groups=()
depends=('mspgcc-binutils' 'mspgcc-mspgcc')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=('!emptydirs' '!libtool' '!strip')
install=

source=("http://surfnet.dl.sourceforge.net/project/mspgcc/msp430mcu/msp430mcu-$pkgver.tar.bz2")
noextract=()
md5sums=('ab4c2541ccf85cb47d983f14ee2d7a00')

build() {
  true # no compilation needed
}

package() {
  msg "Begin packaging"

  cd ${srcdir}/msp430mcu-${pkgver}

  export PREFIX="${pkgdir}/usr/"  

  mkdir -p ${pkgdir}/usr/msp430

  #I ganked the contents of scripts/install.sh and dropped them here

  MSP430MCU_ROOT="${srcdir}/msp430mcu-${pkgver}"
  UPSTREAM=${MSP430MCU_ROOT}/upstream
  ANALYSIS=${MSP430MCU_ROOT}/analysis
  SCRIPTS=${MSP430MCU_ROOT}/scripts

  INCPATH=${PREFIX}/msp430/include
  LIBPATH=${PREFIX}/msp430/lib

  mkdir -p ${INCPATH} ${LIBPATH}

  # Upstream headers
  install -p ${UPSTREAM}/*.h ${INCPATH}

  # Local override headers
  install -p ${MSP430MCU_ROOT}/include/*.h ${INCPATH}

  # Override msp430.h to accommodate legacy MSPGCC MCU identifiers
  install -p ${ANALYSIS}/msp430.h ${INCPATH}

  # MCU-specific data for GCC driver program
  install -p ${ANALYSIS}/msp430mcu.spec ${LIBPATH}

  # Install MCU-specific memory and periph maps
  cp -pr ${ANALYSIS}/ldscripts ${LIBPATH}

}
