# Maintainer: PitBall

pkgbase=lib32-clang
#pkgname=('lib32-llvm'
#        'lib32-clang')
pkgname=lib32-clang
llver=3.4.1
pkgver=3.4
pkgrel=5
pkgdesc="Low Level Virtual Machine (32-bit)"
arch=('x86_64')
url="http://llvm.org/"
license=('custom')
oldver=$( echo $pkgver - 0.1 | bc )
newver=$( echo $pkgver + 0.1 | bc )
makedepends=('lib32-libffi' 'lib32-zlib' 'python2' 'gcc-multilib' 'clang' 'lib32-llvm' 'bc')
source=(http://llvm.org/releases/$pkgver/llvm-$llver.src.tar.gz
        http://llvm.org/releases/$pkgver/clang-$pkgver.src.tar.gz
        http://llvm.org/releases/$pkgver/compiler-rt-$pkgver.src.tar.gz
        .AURINFO)
options=('staticlibs')
sha256sums=('7d28bb6eca243a2bb6d65a05743ab915b57958a7770277364e93534b63eef93a'
            '22a9780db3b85a7f2eb9ea1f7f6e00da0249e3d12851e8dea0f62f1783242b1b'
            'f37c89b1383ce462d47537a0245ac798600887a9be9f63073e16b79ed536ab5c'
            SKIP)

prepare() {
  cd "$srcdir/llvm-$llver.src"

  rm -rf projects/compiler-rt
  mv "$srcdir/clang-$pkgver" tools/clang

  rm -rf projects/compiler-rt
  mv "$srcdir/compiler-rt-$pkgver" projects/compiler-rt

  # Fix installation directories, ./configure doesn't seem to set them right
  sed -i -e 's:\$(PROJ_prefix)/lib:$(PROJ_prefix)/lib32:' \
         -e 's:\$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
    Makefile.config.in
  sed -i '/ActiveLibDir = ActivePrefix/s:lib:lib32:' \
    tools/llvm-config/llvm-config.cpp
  sed -i 's:LLVM_LIBDIR="${prefix}/lib":LLVM_LIBDIR="${prefix}/lib32":' \
    autoconf/configure.ac \
    configure

  # Fix insecure rpath (http://bugs.archlinux.org/task/14017)
  sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules

  # Use system lib32-llvm
  install -d $srcdir/llvm-$llver.src/Release/lib
  for file in ` pacman -Ql lib32-llvm |grep /lib32/ |awk '{print $2}' |sed '/\/$/d'`; do
  ln -sf $file $srcdir/llvm-$llver.src/Release/lib/
  done
}

build() {
  cd "$srcdir/llvm-$llver.src"
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export CLANG="clang -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LLVM_CONFIG=/usr/bin/llvm-config32

  # Include location of libffi headers in CPPFLAGS
  CPPFLAGS+=" $(pkg-config --cflags libffi)"

  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-libffi \
    --enable-targets=x86 \
    --enable-experimental-targets=R600 \
    --enable-bindings=none \
    --disable-expensive-checks \
    --disable-debug-runtime \
    --disable-assertions \
    --with-binutils-include=/usr/include \
    --with-python=/usr/bin/python2 \
    --host=i686-pc-linux-gnu \
    --target=i686-pc-linux-gnu \
    --enable-optimized

#    --disable-clang-static-analyzer \

#  make
  make -C projects/compiler-rt clang_linux
  make -C tools/clang/utils/TableGen
  make -C tools/clang/lib
}

#package_lib32-llvm() {
#  pkgdesc="Low Level Virtual Machine (32-bit)"
#  depends=('lib32-libffi' 'lib32-zlib' 'gcc-multilib' 'llvm')
#
#  cd "$srcdir/llvm-$pkgver.src"
#
#  # We move the clang directory out of the tree so it won't get installed and
#  # then we bring it back in for the clang package
#  mv tools/clang "$srcdir"
#
#  make -j1 DESTDIR="$pkgdir" install
#  mv "$srcdir/clang" tools
#
#  # Fix permissions of static libs
#  chmod -x "$pkgdir"/usr/lib32/*.a
#
#  # Get rid of example Hello transformation
#  rm "$pkgdir"/usr/lib32/*LLVMHello.*
#  rm -rf "$pkgdir"/usr/{lib,include,share}
#
#  install -d "$pkgdir/usr/lib32/bfd-plugins"
#  ln -s ../LLVMgold.so "$pkgdir/usr/lib32/bfd-plugins/LLVMgold.so"
#
#  install -d "$pkgdir/usr/include/llvm/Config"
#  install -m644 $srcdir/llvm-$llver.src/include/llvm/Config/llvm-config.h \
#  "$pkgdir/usr/include/llvm/Config/llvm-config-32.h"
#  install -m644 $srcdir/llvm-$llver.src/include/llvm/Config/config.h \
#  "$pkgdir/usr/include/llvm/Config/config-32.h"
#
#  ln -sf i686-pc-linux-gnu-llvm-config $pkgdir/usr/bin/llvm-config-32
#  ln -sf i686-pc-linux-gnu-llc $pkgdir/usr/bin/llc-32
#}

package_lib32-clang() {
  pkgdesc="CLang 32-bit static libraries"
  url="http://clang.llvm.org/"
  depends=("clang>$oldver" "clang<$newver" "lib32-llvm>$oldver" "lib32-llvm<$newver" 'gcc-multilib')

  install -d $pkgdir/usr/lib32/clang/$pkgver
  ln -s lib32 $pkgdir/usr/lib

  cd "$srcdir/llvm-$llver.src/tools/clang"
  make -C lib DESTDIR="$pkgdir" install
  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/lib32/*.a
  mv $pkgdir/usr/lib32/clang{,/$llver}/include
  rm -rf $pkgdir/usr/lib
}
