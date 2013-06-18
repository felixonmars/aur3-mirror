# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=sbase-ow-git
pkgver=20130613
pkgrel=2
pkgdesc="A suckless variant of the *nix core utilities, built with OpenWatcom"
arch=('i686' 'x86_64')
license=('MIT')
url="http://git.suckless.org/sbase"
makedepends=('git' 'open_watcom')

provides=(sbase-git)
conflicts=(sbase-git)

_gitroot=('http://git.suckless.org/sbase')
_gitname=('sbase')

build() {
  cd $srcdir

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  
  rm -rf $srcdir/build # start fresh
  cp -ar $srcdir/$_gitname $srcdir/build
  
  msg "temporary hacks..."
  touch $srcdir/build/test.1
  ln -s /bin/true $srcdir/build/ranlib
  
  msg "changing Makefile for openWatcom"
  sed -i 's|include|#include|g' $srcdir/build/Makefile
  sed -i 's|@$(AR) -r -c|@$(AR)|g' $srcdir/build/Makefile
  
  msg "deleting targets that currently fail to compile"
  msg2 "missing functions in watcom c-library..."
  sed -i 's|chgrp.c||g' $srcdir/build/Makefile
  sed -i 's|chmod.c||g' $srcdir/build/Makefile
  sed -i 's|chown.c||g' $srcdir/build/Makefile
  sed -i 's|chroot.c||g' $srcdir/build/Makefile
  sed -i 's|cp.c||g' $srcdir/build/Makefile
  sed -i 's|	env.c ||g' $srcdir/build/Makefile
  sed -i 's|grep.c||g' $srcdir/build/Makefile
  sed -i 's|ln.c||g' $srcdir/build/Makefile
  sed -i 's|ls.c||g' $srcdir/build/Makefile
  sed -i 's|mkfifo.c||g' $srcdir/build/Makefile
  sed -i 's|mv.c||g' $srcdir/build/Makefile
  sed -i 's|nl.c||g' $srcdir/build/Makefile
  sed -i 's|pwd.c||g' $srcdir/build/Makefile
  sed -i 's|readlink.c||g' $srcdir/build/Makefile
  sed -i 's|renice.c||g' $srcdir/build/Makefile
  sed -i 's|rm.c||g' $srcdir/build/Makefile
  sed -i 's|tty.c||g' $srcdir/build/Makefile
  sed -i 's|who.c||g' $srcdir/build/Makefile

}

package() {
  cd $srcdir/build/
  
  msg "set up watcom environment variables"
  source /opt/watcom/owsetenv.sh
  export PATH=$srcdir/build:$PATH
  export TERMINFO="/usr/lib/terminfo"
  export WATCOM="/opt/watcom"
  export AS="$WATCOM/binl/wasm"
  export AR="$WATCOM/binl/wlib"
  export AR_FLAGS="-q"
  export RANLIB="/bin/true"
  export CC="$WATCOM/binl/owcc"
  export LD="$WATCOM/binl/owcc"
  export STRIP="$WATCOM/binl/wstrip"

  export WCL386="-zq"
  export WCC386="-zq"
  export WPP386="-I/opt/watcom/lh"
  #some stuff not properly defined in the watcom c-library
  export CFLAGS="$WCC386 -Wextra"
  export CPPFLAGS="$WPP386"
  export LDFLAGS=$WCL386

   
  make DESTDIR=$pkgdir PREFIX=/opt/sbase MANPREFIX=/opt/sbase/man install 
  mkdir -p $pkgdir/usr/share/licenses/sbase/
  install -m644 $srcdir/build/LICENSE $pkgdir/usr/share/licenses/sbase/LICENSE
}