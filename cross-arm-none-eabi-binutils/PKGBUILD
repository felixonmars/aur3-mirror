# Maintainer: Martin Schmölzer <mschmoelzer@gmail.com>

# Based on the summon-arm-toolchain script by Piotr Esden-Tempski
# https://github.com/esden/summon-arm-toolchain

pkgname=cross-arm-none-eabi-binutils
pkgver=2.23.2
pkgrel=2
pkgdesc="A set of programs to assemble and manipulate binary and object files for the ARM EABI (bare-metal) target."
arch=(i686 x86_64)
url="http://www.gnu.org/software/binutils/"
license=('GPL')
groups=('cross-arm-none-eabi')
depends=('glibc' 'zlib')
options=(!libtool !emptydirs)
source=(ftp://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2
        cortex-allow-svc-instruction.patch
        binutils-2.23.2-texinfo-5.0.patch)
sha256sums=('fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097'
            'fa0e25090b85396fedd22a3480e7e469266e5160d7263c02994780781f16e2f9'
            '63e4d49bb6910c49b07a32ab513b239312c605a04559146ebf28b92518a06d33')

build() {
  cd ${srcdir}/binutils-${pkgver}

  patch -Np1 -i "${srcdir}/cortex-allow-svc-instruction.patch"
  patch -Np1 -i "${srcdir}/binutils-2.23.2-texinfo-5.0.patch"

  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  mkdir build
  cd build

  ../configure --target=arm-none-eabi \
               --prefix=/usr \
               --enable-multilib \
               --enable-interwork \
               --with-gnu-as \
               --with-gnu-ld \
               --disable-nls
  make
}

package() {
  cd ${srcdir}/binutils-${pkgver}/build

  make DESTDIR=${pkgdir} install

  # Remove libiberty (conflicts with host binutils) and manpages for MS Windows tools
  rm -f ${pkgdir}/usr/lib/libiberty.a
  rm -f ${pkgdir}/usr/share/man/man1/arm-none-eabi-{dlltool,nlmconv,windres,windmc}*

  # Remove info documents
  rm -rf ${pkgdir}/usr/share/info
}

# vim: set ts=2 sw=2 ft=sh noet:
