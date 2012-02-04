# Maintainer: Jens Staal <staal1978@gmail.com>
# Adopted from: https://aur.archlinux.org/packages.php?ID=12295
# Also check: https://github.com/lll-project/clang/wiki/toolchain_build_instructions

pkgname=lll-git
pkgver=2011.04.30
pkgrel=2
pkgdesc='LLVM/Clang compiler infrastructure, patched for linux compilation, selfhosting.'
arch=('i686' 'x86_64')
url='http://llvm.org/bugs/show_bug.cgi?id=4068'
license=('custom:University of Illinois/NCSA Open Source License')
depends=('libffi' 'clang') #'python' 'ocaml' really needed?
# Future plans: Add 'llvm-compiler-rt-svn' 'libdispatch-blocks-svn' 'libkqueue' for Grand Central Dispatch support
makedepends=('git')
provides=('llvm' 'clang')
conflicts=('llvm' 'llvm-svn' 'clang')

# this is always the latest svn so debug info can be useful
# options=('!strip')

_gitroot='git://github.com/lll-project'

build() {
msg "setting build environment"
cd $srcdir
export CC=clang
export CXX=clang++
export CFLAGS="-O2 -march=native -mtune=native"
export CXXFLAGS="$CFLAGS"
# export LIBS="-lBlocksRuntime -ldispatch"

msg "getting llvm"
  if [ -d llvm ]; then
    cd llvm
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot/llvm.git
  fi

msg "getting clang"
cd $srcdir/llvm/tools
  if [ -d clang ]; then
    cd clang
    git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot/clang.git
  fi

# Experimental. Comment this section out if broken
msg "getting LLVM stdlibc++"
cd $srcdir/llvm/tools/clang/runtime
   if [ -d libcxx ]; then
      cd libcxx
      git pull origin
      msg "The local files are updated"
  else
      git clone $_gitroot/libcxx.git
  fi
# ...to here...

  msg 'GIT checkout done or server timeout'

  msg 'Start building LLVM and Clang with Linux compilation patches'

  cd $srcdir

  rm -rf build # start fresh
  mkdir build
  cd build

  ../llvm/configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-optimized \
    --enable-assertions \
    --enable-targets=host-only \
    --enable-libffi


  make

  make DESTDIR=${pkgdir} install

  # no docs please
#  rm -rf ${pkgdir}/usr/docs

  install -D -m644 $srcdir/llvm/LICENSE.TXT ${pkgdir}/usr/share/licenses/llvm/LICENSE.TXT
}
