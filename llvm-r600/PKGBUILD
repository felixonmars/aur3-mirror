# Maintainer: Armin K. <krejzi at email dot com>

pkgname=('llvm-r600')
pkgver=181042
pkgrel=2
pkgdesc="Low Level Virtual Machine With R600 Backend"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom')
depends=('gcc' 'perl' 'python2' 'ocaml' 'libffi')
makedepends=('python-sphinx' 'subversion')
source=('llvm-Config-config.h'
        'llvm-Config-llvm-config.h')
conflicts=('clang' 'clang-svn' 'clang-analyzer' 'llvm' 'llvm-amdgpu-snapshot' 'llvm-svn' 'llvm-ocaml')
provides=('clang' 'clang-svn' 'clang-analyzer' 'llvm' 'llvm-amdgpu-snapshot' 'llvm-svn' 'llvm-ocaml')
md5sums=('e4f9c0c37d6858baf2a1099a73db0f6e'
         '295c343dcd457dc534662f011d7cff1a')

_svnroot="http://llvm.org/svn/llvm-project"
_llvmsrc="llvm"
_clangsrc="cfe"
_crtsrc="compiler-rt"

prepare() {
  if [ -d ${_llvmsrc}/.svn ]; then
    cd ${_llvmsrc} && svn update -r ${pkgver} && cd ..
  else
    svn co ${_svnroot}/${_llvmsrc}/trunk ${_llvmsrc} -r ${pkgver}
  fi

  if [ -d ${_clangsrc}/.svn ]; then
    cd ${_clangsrc} && svn update -r ${pkgver} && cd ..
  else
    svn co ${_svnroot}/${_clangsrc}/trunk ${_clangsrc} -r ${pkgver}
  fi

  if [ -d ${_crtsrc}/.svn ]; then
    cd ${_crtsrc} && svn update -r ${pkgver} && cd ..
  else
    svn co ${_svnroot}/${_crtsrc}/trunk ${_crtsrc} -r ${pkgver}
  fi

  rm -rf llvm-build
  svn export ${_llvmsrc} llvm-build
  svn export ${_clangsrc} llvm-build/tools/clang
  svn export ${_crtsrc} llvm-build/projects/compiler-rt

  cd llvm-build

  sed -i 's:\$(PROJ_libdir):/usr/lib/llvm:' bindings/ocaml/Makefile.ocaml

  sed -i -e 's:\$(PROJ_prefix)/etc/llvm:/etc/llvm:' \
         -e 's:\$(PROJ_prefix)/lib:$(PROJ_prefix)/lib/llvm:' \
         -e 's:\$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
      Makefile.config.in

  sed -i '/ActiveLibDir = ActivePrefix/s:lib:lib/llvm:' \
      tools/llvm-config/llvm-config.cpp

  sed -i 's:LLVM_LIBDIR="${prefix}/lib":LLVM_LIBDIR="${prefix}/lib/llvm":' \
      autoconf/configure.ac \
      configure

  sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules

  sed -i "s:../lib/libprofile_rt.a:../lib/llvm/libprofile_rt.a:g" \
      tools/clang/lib/Driver/Tools.cpp

  rm -rf "${srcdir}"/python2-path
  mkdir "${srcdir}"/python2-path
  ln -s /usr/bin/python2 "${srcdir}"/python2-path/python
}

build() {
  cd llvm-build

  _optimized_switch="enable"
  [[ $(check_option strip) == n ]] && _optimized_switch="disable"

  CPPFLAGS+=" $(pkg-config --cflags libffi)"
  export PATH="$srcdir/python2-path:$PATH"

  CC=gcc CXX=g++ \
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib/llvm \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-libffi \
    --enable-targets=all \
    --disable-expensive-checks \
    --disable-debug-runtime \
    --disable-assertions \
    --with-binutils-include=/usr/include \
    --$_optimized_switch-optimized \
    --enable-experimental-targets=R600

  make REQUIRES_RTTI=1
  make -C docs -f Makefile.sphinx man
  make -C docs -f Makefile.sphinx html
}

package() {
  cd llvm-build

  make -j1 DESTDIR="${pkgdir}" install

  chmod 644 "${pkgdir}"/usr/lib/llvm/*.a
  chmod 644 "${pkgdir}"/usr/lib/ocaml/libllvm*.a

  rm "${pkgdir}"/usr/lib/llvm/*LLVMHello.*

  install -dm755 "${pkgdir}"/etc/ld.so.conf.d                                            
  echo /usr/lib/llvm > "${pkgdir}"/etc/ld.so.conf.d/llvm-r600.conf

  install -dm755 "${pkgdir}/usr/lib/bfd-plugins"
  ln -s ../llvm/LLVMgold.so "${pkgdir}/usr/lib/bfd-plugins/LLVMgold.so"

  if [[ $CARCH == x86_64 ]]; then
    for _header in config llvm-config; do
      mv "${pkgdir}"/usr/include/llvm/Config/${_header}{,-64}.h
      cp "${srcdir}"/llvm-Config-${_header}.h \
        "${pkgdir}"/usr/include/llvm/Config/${_header}.h
    done
  fi

  install -d "${pkgdir}"/usr/share/man/man1
  cp docs/_build/man/*.1 "${pkgdir}"/usr/share/man/man1/

  cp -r docs/_build/html/* "${pkgdir}"/usr/share/doc/llvm/html/
  rm -rf "${pkgdir}"/usr/share/doc/llvm/html/_sources

  cd tools/clang

  install -d "$pkgdir"/usr/{bin,lib/clang-analyzer}
  for _tool in scan-{build,view}; do
    cp -r tools/${_tool} "${pkgdir}"/usr/lib/clang-analyzer/
    ln -s /usr/lib/clang-analyzer/${_tool}/${_tool} "${pkgdir}"/usr/bin/
  done

  ln -s /usr/bin/clang "${pkgdir}"/usr/lib/clang-analyzer/scan-build/

  install -d "${pkgdir}"/usr/share/man/man1
  mv "${pkgdir}"/usr/lib/clang-analyzer/scan-build/scan-build.1 \
     "${pkgdir}"/usr/share/man/man1/

  sed -i \
    -e 's|env python$|&2|' \
    -e 's|/usr/bin/python$|&2|' \
    "${pkgdir}"/usr/lib/clang-analyzer/scan-view/scan-view \
    "${pkgdir}"/usr/lib/clang-analyzer/scan-build/set-xcode-analyzer

  python2 -m compileall "${pkgdir}"/usr/lib/clang-analyzer
  python2 -O -m compileall "${pkgdir}"/usr/lib/clang-analyzer

  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
