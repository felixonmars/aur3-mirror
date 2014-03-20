# Maintainer: Arch User <alaviss0@gmail.com>
#_llvmver=3.4
_build_polly=1 #Enable building polly
_build_libcxx=1 #Link LLVM with libc++
_build_ocaml=0 #Build LLVM ocaml bindings
pkgname=llvm-openmp-git
pkgver=3.4.r98132.92414b1
pkgrel=2
pkgdesc="LLVM with clang from Clang-OMP project"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA')
depends=('openmprtl-svn' 'perl' 'gcc-libs' 'zlib' 'libffi' 'ncurses' 'python2')
makedepends=('git' 'python2' 'libffi' 'python-sphinx')
provides=('clang=$pkgver' 'llvm-libs=$pkgver' 'llvm=$pkgver' 'clang-analyzer=$pkgver')
conflicts=('llvm' 'clang' 'clang-analyzer' 'llvm-libs')
options=('staticlibs')
source=(llvm::git://github.com/clang-omp/llvm
    clang::git://github.com/clang-omp/clang#branch=clang-omp
    compiler-rt::git://github.com/clang-omp/compiler-rt
    clang-3.3-use-gold-linker.patch
    llvm-Config-config.h
    llvm-Config-llvm-config.h)
md5sums=('SKIP' 'SKIP' 'SKIP' 'a7df7b47f75a568e0e37b4e64a9f4e49'
	'e4f9c0c37d6858baf2a1099a73db0f6e' 
	'295c343dcd457dc534662f011d7cff1a')
[[ $_build_polly = 1 ]] \
 && provides+=('llvm-polly=$pkgver') && conflicts+=('llvm-polly') \
 && makedepends+=('subversion') && depends+=('isl' 'cloog' 'gmp')
[[ $_build_libcxx = 1 ]] && makedepends+=('clang') && depends+=('libc++' 'libc++abi')
[[ $_build_ocaml = 1 ]] && makedepends+=('ocaml') && depends+=('ocaml')
_gitdir="llvm"

pkgver() {
  cd "${srcdir}/${_gitdir}"
  _llvmver=$(cat configure |grep 'PACKAGE_VERSION=' |tr -d 'PACKAGE_VERSION=' |cut -c 2-4)
  printf "%s.r%s.%s" ${_llvmver} "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  msg "Build info: "
  msg2 "LLVM Polly: $([[ $_build_polly = 1 ]] && echo ON) $([[ $_build_polly != 1 ]] && echo OFF)"
  msg2 "LLVM ocaml bindings: $([[ $_build_ocaml = 1 ]] && echo ON) $([[ $_build_ocaml != 1 ]] && echo OFF)"
  msg2 "Link with libc++: $([[ $_build_libcxx = 1 ]] && echo ON) $([[ $_build_libcxx != 1 ]] && echo OFF)"
  mv "${srcdir}/clang" "${srcdir}/llvm/tools/clang"
  mv "${srcdir}/compiler-rt" "${srcdir}/llvm/projects/compiler-rt"
  _llvmver=$(cat "${srcdir}/${_gitdir}/configure" |grep 'PACKAGE_VERSION=' |tr -d 'PACKAGE_VERSION=' |cut -c 2,4)
  [[ ${_build_polly} = 1 ]] && msg "Getting/Updating LLVM Polly source" \
	&& if [[ -d "${srcdir}/../polly/.svn" ]]; then (cd "${srcdir}/../polly/.svn" && svn up -r "HEAD")
	else svn co --config-dir "${srcdir}/../" http://llvm.org/svn/llvm-project/polly/branches/release_${_llvmver} "${srcdir}/../polly" 
        fi && mv "${srcdir}/../polly" "${srcdir}/llvm/tools/polly"
  # Fix clang -flto by pointing ld to ld.gold
  patch -d "${srcdir}/llvm/tools/clang" -Np1 -i "${srcdir}/clang-3.3-use-gold-linker.patch"
  # Fix docs installation directory
  cd "${srcdir}/${_gitdir}"
  sed -i 's:\$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
    Makefile.config.in
}

build() {
  # Include location of libffi headers in CPPFLAGS
  CPPFLAGS+=" $(pkg-config --cflags libffi)"
  cd "${srcdir}/${_gitdir}"
    _optimized_switch="enable"
  [[ $(check_option strip) == n ]] && _optimized_switch="disable"
  [[ $_build_ocaml = 1 ]] || _bind=none
  [[ $_build_polly = 1 ]] && _polly="--with-cloog=/usr --with-isl=/usr"
  [[ $_build_libcxx = 1 ]] && _libcxx="--enable-cxx11 --enable-libcpp"
  [[ $_build_libcxx = 1 ]] && _libcxx="--enable-cxx11 --enable-libcpp"
  [[ $_build_libcxx = 1 ]] && export CXXFLAGS+=" -stdlib=libc++ -lc++abi -Qunused-arguments" && export CC='clang' && export CXX='clang++'
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-libffi \
    --enable-targets=all \
    --disable-expensive-checks \
    --disable-debug-runtime \
    --disable-assertions \
    --with-binutils-include=/usr/include \
    --with-python=/usr/bin/python2 \
    $_libcxx \
    --enable-bindings=$_bind \
    $_polly \
    --$_optimized_switch-optimized
  make REQUIRES_RTTI=1
  make -C docs -f Makefile.sphinx man
  make -C docs -f Makefile.sphinx html
  make -C tools/clang/docs -f Makefile.sphinx html
}

#check() {
#  cd ${srcdir}/${_gitdir} #Take a long time....
#  make check
#}

package() {
  cd ${srcdir}/${_gitdir}
  make DESTDIR=$pkgdir install
  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/lib/*.a

  # Get rid of example Hello transformation
  rm "$pkgdir"/usr/lib/*LLVMHello.*

  # Symlink LLVMgold.so into /usr/lib/bfd-plugins
  # (https://bugs.archlinux.org/task/28479)
  install -d "$pkgdir/usr/lib/bfd-plugins"
  ln -s ../LLVMgold.so "$pkgdir/usr/lib/bfd-plugins/LLVMgold.so"
  # Install man pages
  install -d "$pkgdir/usr/share/man/man1"
  cp docs/_build/man/*.1 "$pkgdir/usr/share/man/man1/"

  # Install html docs
  cp -r docs/_build/html/* "$pkgdir/usr/share/doc/$_gitdir/html/"
  rm -r "$pkgdir/usr/share/doc/$_gitdir/html/_sources"
  install -Dm644 ../${_gitdir}/LICENSE.TXT \
      "${pkgdir}/usr/share/licenses/llvm/LICENSE"
  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stubs are taken from Fedora
    for _header in config llvm-config; do
      mv "$pkgdir/usr/include/llvm/Config/$_header"{,-64}.h
      cp "$srcdir/llvm-Config-$_header.h" \
        "$pkgdir/usr/include/llvm/Config/$_header.h"
    done
  fi
}
# vim:set ts=2 sw=2 et:
