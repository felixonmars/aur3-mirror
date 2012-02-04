# Contributor: Themaister <maister@archlinux.us>
pkgname=libsnes
_pkgbase=bsnes
pkgver=0.083
_pkgver=083
pkgrel=1
pkgdesc="A library that exposes the core emulation of BSNES, a Super Nintendo Entertainment System (SNES) emulator."
arch=('i686' 'x86_64')
url="http://byuu.org/bsnes/"
license=('GPL3')
depends=('gcc>=4.6')
makedepends=('pkgconfig')
replaces=('snesreader' 'supergameboy')

source=("http://bsnes.googlecode.com/files/${_pkgbase}_v${_pkgver}-source.tar.bz2"
        "libco.patch")
md5sums=('a1f017f5276ec5be0bc553db2b7e2241'
         '710a534fb8a217b93ac688b77b234f1d')

build() 
{
   cd "${srcdir}/bsnes_v${_pkgver}-source/bsnes"
   patch -p1 < ${srcdir}/libco.patch

   FLAGS="-O3 -march=native -mtune=native -fomit-frame-pointer -I. -Isnes -fPIC"
   COMPILER=gcc

   # Build library
   # Building the 3 profiles

   echo ""
   echo "==============================="
   echo "## Building Accuracy core"
   echo "==============================="
   echo ""
   make compiler="$COMPILER" flags="$FLAGS -DPROFILE_ACCURACY" profile=accuracy ui=ui-libsnes || return 1
   mv out/libsnes.so out/libsnes-accuracy.so || return 1
   make clean || return 1

   echo ""
   echo "==============================="
   echo "## Building Compatibility core"
   echo "==============================="
   echo ""
   make compiler="$COMPILER" flags="$FLAGS -DPROFILE_COMPATIBILITY" profile=compatibility ui=ui-libsnes || return 1
   mv out/libsnes.so out/libsnes-compat.so || return 1
   make clean || return 1

   echo ""
   echo "==============================="
   echo "## Building Performance core"
   echo "==============================="
   echo ""

   make compiler="$COMPILER" flags="$FLAGS -DPROFILE_PERFORMANCE" profile=performance ui=ui-libsnes || return 1
   mv out/libsnes.so out/libsnes-performance.so || return 1
}

package()
{
   cd "${srcdir}/bsnes_v${_pkgver}-source/bsnes"

   mkdir -p ${pkgdir}/usr/{lib,include} || return 1
   install -m755 out/libsnes-{performance,compat,accuracy}.so ${pkgdir}/usr/lib || return 1

   # Add symlink to default "compat" profile
   ln -s libsnes-compat.so ${pkgdir}/usr/lib/libsnes.so   || return 1
   ln -s libsnes-compat.so ${pkgdir}/usr/lib/libsnes.so.1 || return 1

   install -m644 ui-libsnes/libsnes.hpp ${pkgdir}/usr/include/ || return 1
}

