# Contributor: Jens Staal <staal1978@gmail.com>

pkgname=heirloom-musl-cvs
pkgver=2012
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="The Heirloom Toolchest of standard UNIX utilities, statically linked against musl libc"
url="http://heirloom.sourceforge.net/tools.html"
license=('custom:"opensolaris"' 'custom:"lucent"')
depends=('heirloom-sh-cvs' 'heirloom-devtools-cvs' 'musl' 'musl-zlib')
provides=('heirloom-cvs' 'heirloom')
replaces=('heirloom-cvs')
makedepends=('cvs' 'bc')
source=('000-config.diff' '001-staticdep.diff' 'makefile.patch' \
	'failedbins.patch' 'mode_t.patch' 'users.patch')
md5sums=('f9be8f1cc57f87425b39414a7db06543' '115355b6058592f9ba16a1c011f27ecd' \
	  '9112b52fddffa66cd464eeecd0109a21' '4df93f69bf7b793ea57a813658449026' \
	  '21e5f2f6b601a3ad606b9812ad48e745'  '043d75336278a3681a8e9c27e0823456')

_hmake() {
	env PATH="/usr/heirloom/bin:$PATH" MAKEFLAGS="" make "$@"
}

build() {
  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom login

  cvs -d:pserver:anonymous:@heirloom.cvs.sourceforge.net:/cvsroot/heirloom co -P heirloom

  rm -rf $srcdir/build
  cp -ar $srcdir/heirloom $srcdir/build
  cd $srcdir/build

  patch -p1 < ../000-config.diff
  patch -p1 < ../001-staticdep.diff
  patch $srcdir/build/makefile -i $srcdir/makefile.patch
  patch $srcdir/build/echo/defs.h $srcdir/mode_t.patch # mode_t define not included in included headers
  patch $srcdir/build/test/defs.h $srcdir/mode_t.patch # mode_t define not included in included headers
  patch $srcdir/build/users/users.c $srcdir/users.patch # utmpxname does not exist in musl.
  # "ls, more, pg, tabs,ul" fail to build --> depend on curses
  # tapecntl still annoying
  patch $srcdir/build/makefile -i $srcdir/failedbins.patch
  
msg "add symlinks to important header files"

  mkdir -p $srcdir/build/libcommon/sys
  ln -s /usr/musl/include/dirent.h $srcdir/build/libcommon/sys/dirent.h
  ln -s /usr/include/linux/mtio.h $srcdir/build/libcommon/sys/mtio.h
  cp -ar /usr/include/linux $srcdir/build/libcommon/
  cp -ar /usr/include/asm $srcdir/build/libcommon/
  cp -ar /usr/include/asm-generic $srcdir/build/libcommon/

  #annoyingly, the include paths are overwritten otherwise...  
msg "start building statically against musl"
  _hmake CC="musl-gcc -static -I. -I../libcommon -I/usr/musl/include -D_GNU_SOURCE -D__NEED_mode_t" 
}

package() {
  cd $srcdir/build

  _hmake install ROOT="$pkgdir"

  mkdir -p $startdir/pkg/usr/share/licenses/$pkgname/
  install -m0644 ${startdir}/src/heirloom/LICENSE/LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/LICENSE
  install -m0644 ${startdir}/src/heirloom/LICENSE/OPENSOLARIS.LICENSE ${startdir}/pkg/usr/share/licenses/${pkgname}/OPENSOLARIS.LICENSE
  install -m0644 ${startdir}/src/heirloom/LICENSE/LUCENT ${startdir}/pkg/usr/share/licenses/${pkgname}/LUCENT
}