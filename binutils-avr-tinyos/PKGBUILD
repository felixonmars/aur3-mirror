# Maintainer: Andras Biro <bbandi86@gmail.com>
# Contributor: Andrea Fagiani <andfagiani_at_gmail_dot_com>
# PKGBUILD based on the binutils-avr PKGBUILD by
#	Corrado Primier <bardo@aur.archlinux.org> and danst0 <danst0@west.de>

pkgname=binutils-avr-tinyos
pkgver=2.17
pkgrel=4
pkgdesc="A set of programs to assemble and manipulate binary and object files for the avr architecture, with TinyOS patches"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/binutils/"
license=('GPL')
depends=('glibc>=2.12-5' 'zlib')
makedepends=('subversion')
provides=('binutils-avr')
options=('staticlibs' '!libtool' '!distcc' '!ccache')
source=("http://ftp.gnu.org/gnu/binutils/binutils-${pkgver}.tar.bz2"
        "https://dl.dropboxusercontent.com/u/363226/munka/packages/arch/texinfo-4.13a-8-${CARCH}.pkg.tar.xz")
sha1sums=('0f5c10d155d7ef67c5eb1261f84e70e2b92293fa')

if test "${CARCH}" == x86_64; then
  sha1sums+=('184986f1c92de92fb72185d1eb9f7ca597fe6637')
else
  sha1sums+=('38dfa704773da3ea12cb8bc026674cc28d62449d')
fi

build() {
	cd ${srcdir}

	svn checkout http://tinyos-main.googlecode.com/svn/trunk/packaging/old-toolchain/avr-binutils/patch/
	cd binutils-${pkgver}
	cat ../patch/*.patch|patch -p0

  # hack! - libiberty configure tests for header files using "$CPP $CPPFLAGS" - credits to jck
  sed -i "/ac_cpp=/s/\$CPPFLAGS/\$CPPFLAGS -O2/" libiberty/configure

  export MAKEINFO=${srcdir}/usr/bin/makeinfo

  install -d build
  cd build
  export CC="gcc -L$(pwd)/bfd/.libs/"

  if [ "${CARCH}" = "x86_64" ]; then
    ../configure --build=$(../config.guess) \
                 --disable-multilib \
                 --disable-nls \
                 --enable-64-bit-bfd \
                 --enable-install-libbfd \
                 --includedir=/usr/$(../config.guess)/include \
                 --infodir=/usr/share/info \
                 --libdir=/usr/lib \
                 --mandir=/usr/share/man \
                 --prefix=/usr \
                 --target=avr \
                 --disable-werror
  else
    ../configure --build=$(../config.guess) \
                 --disable-nls \
                 --enable-install-libbfd \
                 --includedir=/usr/$(../config.guess)/include \
                 --infodir=/usr/share/info \
                 --libdir=/usr/lib \
                 --mandir=/usr/share/man \
                 --prefix=/usr \
                 --target=avr \
                 --disable-werror
  fi

  # This checks the host environment and makes sure all the necessary tools are available to compile Binutils.
  make configure-host || return 1

  make tooldir=/usr || return 1
}

package() {
  cd ${srcdir}/binutils-${pkgver}

  cd build
  make DESTDIR=${pkgdir} tooldir=/usr install || return 1

  rm -f ${pkgdir}/usr/lib/libiberty.a

  for bin in addr2line ar as c++filt gprof ld nm objcopy objdump ranlib readelf size strings strip ; do
    rm -f ${pkgdir}/usr/bin/${bin} || return 1
  done

  for info in as bfd binutils configure ld standards; do
    mv ${pkgdir}/usr/share/info/${info}.info ${pkgdir}/usr/share/info/avr-${info}.info || return 1
  done
}

# vim:set ts=2 sw=2 et:
