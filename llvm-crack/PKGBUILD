# $Id: PKGBUILD 165098 2012-08-10 21:21:52Z foutrelis $
# Maintainer: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=('llvm-crack')
pkgver=3.3
pkgrel=1
provides=('llvm=3.3')
conflicts=('llvm')
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('libffi' 'python2' 'ocaml')
options=('staticlibs')
source=(http://llvm.org/releases/$pkgver/llvm-$pkgver.src.tar.gz
        http://llvm.org/releases/$pkgver/cfe-$pkgver.src.tar.gz
        http://llvm.org/releases/$pkgver/compiler-rt-$pkgver.src.tar.gz
        clang-3.3-use-gold-linker.patch
        llvm-Config-config.h
        llvm-Config-llvm-config.h
        JITEmitter.patch)
sha256sums=('68766b1e70d05a25e2f502e997a3cb3937187a3296595cf6e0977d5cd6727578'
            'b1b55de4ab3a57d3e0331a83e0284610191c77d924e3446498d9113d08dfb996'
            '0e2f3180d6316e6c43f064fdd406c5c6515e682c5f31c57c28335b68c7525423'
            '8240adda155d7961eeb5d07ed50ead10cb7125f70283dff7f1c9fee9df3cea09'
            '312574e655f9a87784ca416949c505c452b819fad3061f2cde8aced6540a19a3'
            '597dc5968c695bbdbb0eac9e8eb5117fcd2773bc91edf5ec103ecffffab8bc48'
            'a8107d4a4d6b5e9875849edc08d928c8d505ee199c26ae0914fc137f60bf23b8')


prepare() {
  cd "$srcdir/llvm-$pkgver.src"

  # At the present, clang must reside inside the LLVM source code tree to build
  # See http://llvm.org/bugs/show_bug.cgi?id=4840
  mv "$srcdir/cfe-$pkgver.src" tools/clang

  mv "$srcdir/compiler-rt-$pkgver.src" projects/compiler-rt

  # Fix docs installation directory
  sed -i 's:\$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
    Makefile.config.in

  # Fix insecure rpath (http://bugs.archlinux.org/task/14017)
  sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' Makefile.rules

  # Make -flto work; use ld.gold instead of the default linker
  patch -d tools/clang -Np1 -i "$srcdir/clang-3.3-use-gold-linker.patch"

  # Fix bug #13678: Exception table generation does not retry on buffer overflow
  # http://llvm.org/bugs/show_bug.cgi?id=13678
  #patch -Np0 -d "lib/ExecutionEngine/JIT" -i "$srcdir/JITEmitter.patch"
  # already included
}

build() {
  cd "$srcdir/llvm-$pkgver.src"

  # Apply strip option to configure
  _optimized_switch="enable"
  [[ $(check_option strip) == n ]] && _optimized_switch="disable"

  # Include location of libffi headers in CPPFLAGS
  CPPFLAGS+=" $(pkg-config --cflags libffi)"

  # Force the use of GCC instead of clang
  CC=gcc CXX=g++ \
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-shared \
    --enable-libffi \
    --enable-targets=all \
    --enable-experimental-targets=R600 \
    --disable-expensive-checks \
    --disable-debug-runtime \
    --disable-assertions \
    --with-binutils-include=/usr/include \
    --with-python=/usr/bin/python2 \
    --$_optimized_switch-optimized

  make REQUIRES_RTTI=1
}

package_llvm-crack() {
  pkgdesc="Low Level Virtual Machine - patched for crack"
  depends=('perl' 'libffi')

  cd "$srcdir/llvm-$pkgver.src"

  # We move the clang directory out of the tree so it won't get installed and
  # then we bring it back in for the clang package
  mv tools/clang "$srcdir"

  # -j1 is due to race conditions during the installation of the OCaml bindings
  make -j1 DESTDIR="$pkgdir" install

  # OCaml bindings go to a separate package
  rm -rf "$srcdir"/{ocaml,ocamldoc}
  mv "$pkgdir"/usr/{lib/ocaml,share/doc/llvm/ocamldoc} "$srcdir"

  # Remove duplicate files installed by the OCaml bindings
  rm "$pkgdir"/usr/{lib/libllvm*,share/doc/llvm/ocamldoc.tar.gz}

  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/lib/*.a

  # Get rid of example Hello transformation
  rm "$pkgdir"/usr/lib/*LLVMHello.*

  # Symlink LLVMgold.so into /usr/lib/bfd-plugins
  # (https://bugs.archlinux.org/task/28479)
  install -d "$pkgdir/usr/lib/bfd-plugins"
  ln -s ../llvm/LLVMgold.so "$pkgdir/usr/lib/bfd-plugins/LLVMgold.so"

  if [[ $CARCH == x86_64 ]]; then
    # Needed for multilib (https://bugs.archlinux.org/task/29951)
    # Header stubs are taken from Fedora
    for _header in config llvm-config; do
      mv "$pkgdir/usr/include/llvm/Config/$_header"{,-64}.h
      cp "$srcdir/llvm-Config-$_header.h" \
        "$pkgdir/usr/include/llvm/Config/$_header.h"
    done
  fi

  install -Dm644 LICENSE.TXT "$pkgdir/usr/share/licenses/llvm/LICENSE"
}

# vim:set ts=2 sw=2 et:
