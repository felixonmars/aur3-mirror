# Maintainer: Ingo Becker <ingo@orgizm.net>
# Contributor: Peter Hatina <phatina@gmail.com>
# Contributor: cbounce

pkgname="libsimavr-git"
pkgver=20120307
pkgrel=1
pkgdesc="simavr including libsimavr and needed headers"
arch=('i686' 'x86_64')
url="http://gitorious.org/simavr"
license=('GPL3')
depends=('gcc-avr' 'binutils-avr')
conflicts=('simavr-git')
makedepends=('git' 'patch' 'make' 'gcc' 'elfutils' 'avr-libc' 'gcc-avr' 'binutils-avr')
source=('makefile.patch' 'avrgpp.patch' 'sim_avr.patch')
md5sums=('5c552b2427003ae203ce83f7d19cccbb' 
         'cee65ff88740cb75669b83b46a85846e'
         '6295603200093f44ca2e71f969457d12')
options=(!strip)

_gitroot="git://gitorious.org/simavr/simavr.git"
_gitname="simavr"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  # patching the makefile to find arch's avr root
  patch -p1 -i $startdir/makefile.patch
  patch -p1 -i $startdir/avrgpp.patch
  unset LDFLAGS

  #hacky shit
  cd simavr/cores
  mv sim_mega128.c sim_mega128.c_skip
  cd ../..
  #end shit

  make
}

package() {
  # installing simavr binary
  install -m755 -D $srcdir/$_gitname-build/simavr/run_avr $pkgdir/usr/bin/simavr
  # installing tests
  install -m755 -d -D $srcdir/$_gitname-build/tests $pkgdir/usr/share/simavr/tests
  # install includes
  install -m755 -d -D $srcdir/$_gitname-build/include $pkgdir/usr/avr/include/simavr
  cp -a $srcdir/$_gitname-build/include/* $pkgdir/usr/avr/include/simavr
  # since the package doesn't provide a make install...
  cp -a $srcdir/$_gitname-build/tests/* $pkgdir/usr/share/simavr/tests
  # installing examples
  install -m755 -d -D $srcdir/$_gitname-build/examples $pkgdir/usr/share/simavr/examples
  # ugly, but works
  cp -a $srcdir/$_gitname-build/examples/* $pkgdir/usr/share/simavr/examples

  # libsimavr
  mkdir -p $pkgdir/usr/include/simavr
  cp $srcdir/$_gitname/simavr/sim/*.h $pkgdir/usr/include/simavr
  cp $srcdir/$_gitname-build/include/*.h $pkgdir/usr/include/simavr
  OBJ=obj-$(gcc -dumpmachine)
  mkdir $pkgdir/usr/lib
  cp $srcdir/$_gitname-build/simavr/$OBJ/libsimavr.so $pkgdir/usr/lib
  ldconfig -n $pkgdir/usr/lib/libsimavr.so
}
