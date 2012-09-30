# based on cross-gcc of: rubenvb vanboxem <dottie> ruben <attie> gmail <dottie> com
pkgname=mingw-w64-gdc
pkgver=4.7.1
pkgrel=1
pkgdesc="Cross GDC for the MinGW-w64 cross-compiler"
arch=('i686' 'x86_64')
url="http://gcc.gnu.org"
license=('GPL' 'LGPL' 'FDL' 'custom')
groups=('mingw-w64-toolchain' 'mingw-w64')
depends=('zlib' 'libmpc' 'ppl' 'cloog' 'mingw-w64-crt' 'mingw-w64-binutils' 'mingw-w64-winpthreads')
makedepends=('mingw-w64-headers-bootstrap')
#checkdepends=('dejagnu') # Windows executables could run on Arch through bin_mft and Wine
optdepends=()
provides=('mingw-w64-gcc-base')
conflicts=('mingw-w64-gcc-base')
replaces=()
backup=()
options=('!strip' '!libtool' '!emptydirs' '!buildflags')
source=("ftp://gcc.gnu.org/pub/gcc/releases/gcc-${pkgver}/gcc-${pkgver}.tar.bz2"
        'gcc-4.7.0-cloog-0.17.patch'
	'gcc_pure64.patch')
md5sums=('933e6f15f51c031060af64a9e14149ff'
         '488f11cf9822d110dde4a12add1d6e03'
	 'ced48436c1b3c981d721a829f1094de1')

_targets="i686-w64-mingw32 x86_64-w64-mingw32"
#_targets="i686-w64-mingw32"

build() {
  cd ${srcdir}/gcc-${pkgver}

  #do not install libiberty
  sed -i 's/install_to_$(INSTALL_DEST) //' libiberty/Makefile.in

  # compatibility with latest cloog
  patch -Np1 -i ${srcdir}/gcc-4.7.0-cloog-0.17.patch

  if [ "${CARCH}" = "x86_64" ]; then
    patch -p1 -i ${srcdir}/gcc_pure64.patch
  fi

  cd ${srcdir}

  msg "Cloning gdc"
  if [[ -d "gdc" ]]; then
    cd ./gdc
    git pull origin gdc-4.7
  else
    git clone --depth=1 -b gdc-4.7 git://github.com/D-Programming-GDC/gdc.git gdc
    cd ./gdc
  fi

  msg "Patching gcc"
  ./update-gcc.sh ./../gcc-${pkgver} --setup

  cd ${srcdir}/gcc-${pkgver}

  echo ${pkgver} > gcc/BASE-VER

  for _target in ${_targets}; do
    mkdir -p ${srcdir}/gcc-build-${_target} && cd ${srcdir}/gcc-build-${_target}
    
    ${srcdir}/gcc-${pkgver}/configure --prefix=/usr \
        --target=${_target} \
        --enable-languages=d \
        --enable-shared --enable-static \
        --enable-threads=win32 --enable-fully-dynamic-string --enable-lto \
        --with-system-zlib --with-ppl --enable-cloog-backend=isl \
        --enable-libgomp --enable-sjlj-exceptions \
        --disable-nls \
        --disable-multilib --enable-checking=release
    make all
  done
}

package() {
  for _target in ${_targets}; do
    cd ${srcdir}/gcc-build-${_target}
    make DESTDIR=${pkgdir} install
    ${_target}-strip ${pkgdir}/usr/${_target}/lib/*.dll
    strip ${pkgdir}/usr/bin/${_target}-*
    strip ${pkgdir}/usr/libexec/gcc/${_target}/${pkgver}/{cc1*,collect2,gnat1,f951,lto*}
  done
  strip ${pkgdir}/usr/bin/*
  # remove unnecessary files
  rm -r ${pkgdir}/usr/share
}
