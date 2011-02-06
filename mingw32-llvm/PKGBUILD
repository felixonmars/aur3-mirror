# Maintainer: Carl Reinke <mindless2112 gmail com>
# Maintainer: Evangelos Foutras <foutrelis@gmail.com>
# Contributor: Sebastian Nowicki <sebnow@gmail.com>
# Contributor: Devin Cofer <ranguvar{AT]archlinux[DOT}us>
# Contributor: Tobias Kieslich <tobias@justdreams.de>
# Contributor: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=mingw32-llvm
pkgver=2.7
pkgrel=2
pkgdesc="Low Level Virtual Machine"
arch=('i686' 'x86_64')
url="http://llvm.org/"
license=('custom:University of Illinois/NCSA Open Source License')
makedepends=('mingw32-gcc')
source=(http://llvm.org/releases/$pkgver/llvm-$pkgver.tgz
        llvm-config.patch)
md5sums=('ac322661f20e7d6c810b1869f886ad9b'
         'b5e98c0a408abc2e615f6e837a380e20')

build() {
  cd "$srcdir/llvm-$pkgver"

  # fix wrong linking order in llvm-config
  patch -d tools/llvm-config -p1 -i "$srcdir/llvm-config.patch" || return 1

  # Fix installation directories, ./configure doesn't seem to set them right
  sed -i -e 's:\$(PROJ_prefix)/etc/llvm:/etc/llvm:' \
         -e 's:\$(PROJ_prefix)/lib:$(PROJ_prefix)/lib/llvm:' \
         -e 's:\$(PROJ_prefix)/docs/llvm:$(PROJ_prefix)/share/doc/llvm:' \
         Makefile.config.in || return 1

  # Fix insecure rpath (http://bugs.archlinux.org/task/14017)
  sed -i 's:$(RPATH) -Wl,$(\(ToolDir\|LibDir\|ExmplDir\))::g' \
         Makefile.rules || return 1

  # Apply strip option to configure
  _optimize_flag="--enable-optimize"
  [ "$(check_option strip)" = "n" ] && _optimize_flag="--disable-optimize"

  unset LDFLAGS # mingw-ld chokes on the makepkg default: --hash-style

  # llvm needs to be built in parallel
  mkdir -p "../llvm-$pkgver-build"
  cd "../llvm-$pkgver-build"

  ../llvm-$pkgver/configure --host=i486-mingw32 \
                            --prefix=/usr/i486-mingw32 --libdir=/usr/i486-mingw32/lib/llvm --sysconfdir=/etc \
                            --enable-targets=all \
                            --disable-expensive-checks --disable-debug-runtime \
                            --disable-assertions $_optimize_flag
  
  make || return 1
}

package()  {
  cd "$srcdir/llvm-$pkgver-build"

  make DESTDIR="$pkgdir" install || return 1

  # Remove files installed by the OCaml bindings
  rm -rf "$pkgdir"/usr/i486-mingw32/{lib/ocaml,share/doc/llvm/ocamldoc}
  rm -f "$pkgdir"/usr/i486-mingw32/{lib/llvm/libllvm*,share/doc/llvm/ocamldoc.tar.gz}

  # Fix permissions of static libs
  chmod -x "$pkgdir"/usr/i486-mingw32/lib/llvm/*.a

  # Fix libdir in llvm-config (http://bugs.archlinux.org/task/14487)
  sed -i 's:\(ABS_RUN_DIR/lib\):\1/llvm:' \
         "$pkgdir/usr/i486-mingw32/bin/llvm-config" || return 1

  install -Dm644 ../llvm-$pkgver/LICENSE.TXT "$pkgdir/usr/i486-mingw32/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
