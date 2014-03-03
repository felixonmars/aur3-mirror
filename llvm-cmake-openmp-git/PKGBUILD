# Maintainer: Arch User <alaviss0@gmail.com>
_llvmver=3.4 #Researching for auto find llvmver...
_build_polly=1 #Enable building polly
_build_lld=0 #Enable building lld
_build_libcxx=1 #Link LLVM with libc++
pkgname=llvm-cmake-openmp-git
pkgver=3.4.r98132.92414b1
pkgrel=1
pkgdesc="LLVM with clang from Clang-OMP project (Build with cmake)"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA')
depends=('gcc-libs' 'libffi=3.0.13' 'python2' 'openmprtl-svn')
makedepends=('git' 'python2' 'cmake')
provides=('clang=$_llvmver' 'llvm=$_llvmver' 'clang-analyzer')
conflicts=('llvm' 'clang' 'clang-analyzer')
source=(llvm::git+https://github.com/clang-omp/llvm
    clang::git+https://github.com/clang-omp/clang#branch=clang-omp
    compiler-rt::git+https://github.com/clang-omp/compiler-rt
    clang-3.3-use-gold-linker.patch)
md5sums=('SKIP' 'SKIP' 'SKIP' 'a7df7b47f75a568e0e37b4e64a9f4e49')
[[ $_build_polly = 1 ]] \
 && source+=("polly::svn+http://llvm.org/svn/llvm-project/polly/branches/release_"$(echo $_llvmver | cut -b1,3)) \
 && provides+=('llvm-polly=$_llvmver') && conflicts+=('llvm-polly') && md5sums+=('SKIP') \
 && makedepends+=('subversion') && depends+=('isl' 'cloog' 'gmp')
[[ $_build_lld = 1 ]] \
 && source+=('lld::svn+http://llvm.org/svn/llvm-project/lld/branches/release_'$(echo $_llvmver | cut -b1,3)) \
 && provides+=('lld=$_llvmver') && conflicts+=('lld') && md5sums+=('SKIP') \
 && makedepends+=('subversion')
[[ $_build_libcxx = 1 ]] && makedepends+=('clang') && depends+=('libc++' 'libc++abi')

_gitdir="llvm"
_build="${_gitdir}-build"

pkgver() {
  cd "${srcdir}/${_gitdir}"
  printf "%s.r%s.%s" ${_llvmver} "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  git clone "${srcdir}/clang" "${srcdir}/llvm/tools/clang"
  git clone "${srcdir}/compiler-rt" "${srcdir}/llvm/projects/compiler-rt"
  [[ $_build_polly = 1 ]] && mv "${srcdir}/polly" "${srcdir}/llvm/tools/polly"
  [[ $_build_lld = 1 ]] && mv "${srcdir}/lld" "${srcdir}/llvm/tools/lld"
  # Fix clang -flto by pointing ld to ld.gold
  patch -d "${srcdir}/llvm/tools/clang" -Np1 -i "${srcdir}/clang-3.3-use-gold-linker.patch"
}

build() {
  mkdir -p "${srcdir}/${_build}"
  cd "${srcdir}/${_build}"
  [[ $_build_libcxx = 1 ]] && _libcxx="-DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++"
  [[ $_build_libcxx = 1 ]] && export CXXFLAGS="${CXXFLAGS} -stdlib=libc++ -lc++abi"
  cmake ../${_gitdir} -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_FULL_DOCDIR=/usr/share/doc/llvm \
	-DLLVM_ENABLE_FFI:BOOL=ON \
	-DLLVM_BINUTILS_INCDIR=/usr/include \
	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	-DLLVM_ENABLE_ASSERTIONS=OFF \
	-DFFI_INCLUDE_DIR=/usr/lib/libffi-3.0.13/include \
	-DFFI_LIBRARY_DIR=/usr/lib/ \
	-DBUILD_SHARED_LIBS=ON \
	-DLLVM_ENABLE_CXX11=ON \
	-DLLVM_ENABLE_LIBCXX=ON \
	-DCMAKE_BUILD_TYPE=Release \
	$_libcxx
  make REQUIRES_RTTI=1
}

#check() {
#  cd ${srcdir}/${_build} #Take a long time....
#  make check
#}

package() {
  cd ${srcdir}/${_build}
  make DESTDIR=$pkgdir install
  install -Dm644 ../${_gitdir}/LICENSE.TXT \
      "${pkgdir}/usr/share/licenses/llvm/LICENSE"
}
# vim:set ts=2 sw=2 et:
