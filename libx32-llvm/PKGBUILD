# $Id: PKGBUILD 74483 2012-07-29 14:47:55Z lcarlier $
# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=('libx32-llvm')
pkgver=3.1
pkgrel=2.1
arch=('x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('libx32-libffi' 'python2-x32' 'gcc-multilib-x32')
source=(http://llvm.org/releases/$pkgver/llvm-$pkgver.src.tar.gz)
sha256sums=('1ea05135197b5400c1f88d00ff280d775ce778f8f9ea042e25a1e1e734a4b9ab')

build() {
  cd "$srcdir/llvm-$pkgver.src"

  export CC="gcc -mx32"
  export CXX="g++ -mx32"
  export PKG_CONFIG_PATH="/usr/libx32/pkgconfig"

  rm -rf tools/clang
  rm -rf projects/compiler-rt

  # Fix installation directories, ./configure doesn't seem to set them right
  sed -i -e 's:\$(PROJ_prefix)/etc/llvm:/etc/llvm:' \
         -e 's:\$(PROJ_prefix)/lib:$(PROJ_prefix)/libx32/llvm:' \
         -e 's:\$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
    Makefile.config.in
  sed -i '/ActiveLibDir = ActivePrefix/s:lib:libx32/llvm:' \
    tools/llvm-config/llvm-config.cpp
  sed -i 's:LLVM_LIBDIR="${prefix}/lib":LLVM_LIBDIR="${prefix}/libx32/llvm":' \
    autoconf/configure.ac \
    configure

  # Fix insecure rpath (http://bugs.archlinux.org/task/14017)
  sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules

  # Apply strip option to configure
  _optimized_switch="enable"
  [[ $(check_option strip) == n ]] && _optimized_switch="disable"

  # Include location of libffi headers in CPPFLAGS
  export CPPFLAGS="$CPPFLAGS $(pkg-config --cflags libffi)"

  # Use Python 2
  mkdir "$srcdir/python2-path"
  ln -s /opt/python2-x32/bin/python2.7 "$srcdir/python2-path/python"
  export PATH="$srcdir/python2-path:$PATH"

  # We had to force host and target to get
  # a proper triplet reported by llvm

  ./configure \
    --prefix=/usr \
    --libdir=/usr/libx32/llvm \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-libffi \
    --enable-targets=all \
    --disable-expensive-checks \
    --disable-debug-runtime \
    --disable-assertions \
    --with-binutils-include=/usr/include \
    --host=i386-pc-linux-gnu \
    --target=i386-pc-linux-gnu \
    --$_optimized_switch-optimized


#    --with-cxx-include-arch=$CHOST \

  make REQUIRES_RTTI=1
}

package() {
  pkgdesc="Low Level Virtual Machine (x32 ABI version)"
  depends=('libx32-libffi' 'llvm')

  cd "$srcdir/llvm-$pkgver.src"

  # We move the clang directory out of the tree so it won't get installed and
  # then we bring it back in for the clang package
  # mv tools/clang "$srcdir"
  # -j1 is due to race conditions during the installation of the OCaml bindings
  make -j1 DESTDIR="$pkgdir" install

  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/libx32/llvm/*.a

  mv "$pkgdir/usr/bin/llvm-config" "$pkgdir/usr/libx32/llvm-config"

  # Get rid of example Hello transformation
  rm "$pkgdir"/usr/libx32/llvm/*LLVMHello.*

  # Symlink the gold plugin where clang expects it
  ln -s llvm/LLVMgold.so "$pkgdir/usr/libx32/LLVMgold.so"

  # Add ld.so.conf.d entry
  install -d "$pkgdir/etc/ld.so.conf.d"
  echo /usr/libx32/llvm >"$pkgdir/etc/ld.so.conf.d/llvmx32.conf"

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  mv "$pkgdir"/usr/include/llvm/Config/*config.h "$pkgdir/"
  rm -r "$pkgdir"/usr/{bin,include,share/{doc,man}}
  install -d "$pkgdir/usr/include/llvm/Config"
  mv "$pkgdir/config.h" "$pkgdir/usr/include/llvm/Config/config-x32.h"
  mv "$pkgdir/llvm-config.h" "$pkgdir/usr/include/llvm/Config/llvm-config-x32.h"

  mkdir "$pkgdir"/usr/bin
  mv "$pkgdir/usr/libx32/llvm-config" "$pkgdir/usr/bin/llvm-configx32"
}
