# Maintainer: Geoffroy Carrier <geoffroy.carrier@aur.archlinux.org>
# Contributor: Tomas Lindquist Olsen <tomas@famolsen.dk>
# Contributor: Roberto Alsina <ralsina@kde.org>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

# Contributor: Kristaps Esterlins <esterlinsh@gmail.com>

pkgname=llvm-etoile
_pkgname=llvm
pkgver=2.5
pkgrel=1
pkgdesc="Low Level Virtual Machine"
arch=('i686' 'x86_64')
url="http://llvm.org"
license=('custom':'University of Illinois/NCSA Open Source License')
depends=('libelf')
conflicts=('llvm')
replaces=('llvm')
source=("http://llvm.org/releases/$pkgver/${_pkgname}-$pkgver.tar.gz"
        gcc-4.4.patch llvm-etoile.patch)
md5sums=('55df2ea8665c8094ad2ef85187b9fc74'
         '50437398b35e1979bad506151b549737'
				 'e8a20bf6169a858f2af49a4b3a82c05a')

build() {
  cd $srcdir/${_pkgname}-$pkgver

  # GCC 4.4 fixes
  patch -p1 -i "$srcdir/gcc-4.4.patch" || return 1

	# Fix for Etoile Stable version | http://etoileos.com/downloads/install/
	
	patch -p0 -i "$srcdir/llvm-etoile.patch" || return 1

  # --sysconfdir to configure apparently isn't enough ...
  sed -i 's:$(PROJ_prefix)/etc/llvm:/etc/llvm:' Makefile.config.in || return 1
  # --libdir to configure apparently isn't enough ...
  sed -i 's:$(PROJ_prefix)/lib:$(PROJ_prefix)/lib/llvm:' \
    Makefile.config.in || return 1
  # Fix insecure rpath http://bugs.archlinux.org/task/14017
  sed -i 's:-rpath \$(ToolDir)::g' Makefile.rules || return 1
  # Fix path that point to the build directory
  sed -i 's:^TOOLDIR.*:TOOLDIR=/usr/bin:' \
    tools/gccld/gccld.sh tools/gccas/gccas.sh || return 1
  # remove docs from the make targets
  sed -i 's:runtime docs:runtime:' Makefile || return 1
  # remove libHello transformation
  sed -i 's: Hello::' lib/Transforms/Makefile || return 1

  if [ "${CARCH}" = "x86_64" ]; then
    _pic_flag="--enable-pic"
  else
    _pic_flag=""
  fi
  
  ./configure --prefix=/usr \
    --libdir=/usr/lib/llvm \
    --sysconfdir=/etc \
    --enable-bindings=none \
    --enable-targets=host-only \
    --enable-optimized \
    --disable-assertions \
    --disable-expensive-checks ${_pic_flag} || return 1
  
  make || return 1

  # install fails with more than one make job
  make -j1 DESTDIR="$pkgdir" install || return 1


  # Fix libpath in llvm-config
  sed -i 's:\(ABS_RUN_DIR/lib\):\1/llvm:' \
    "$pkgdir/usr/bin/llvm-config" || return 1

  install -D LICENSE.TXT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
