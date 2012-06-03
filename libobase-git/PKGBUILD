 
# Maintainer: Jens Staal <staal1978@gmail.com>

pkgname=libobase-git
pkgver=20120603
pkgrel=1
pkgdesc="A modified libbsd including source from openBSD and FreeBSD libc"
arch=('i686' 'x86_64')
url="https://github.com/chneukirchen/obase/"
#url="http://www.openbsd.org/"
license=('BSD')
depends=('bmake' 'openssl')
makedepends=('git')
options=(!strip)
provides=('libobase')
sources=('makefile.patch')
md5sums=('43196a30ff0ca3e1033019c634e41a57')

_gitroot=('git://github.com/chneukirchen/obase.git')
_gitname=('obase')

build() {
 cd $srcdir

msg "getting obase sources"
   if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi
  

msg "setting up build directory"
  rm -rf $srcdir/build #starting fresh
  cp -ar $srcdir/$_gitname/libobase $srcdir/build
  cd $srcdir/build
#patch Makefile to avoid building the rest of obase
  patch -p0 Makefile $startdir/makefile.patch
  bmake
}

package() {
  mkdir -p $pkgdir/usr/{lib,include/libobase,share/licenses/libobase}
  export DESTDIR=$pkgdir
  cd $srcdir/build
  bmake install
  msg "copying libobase include directory to /usr/include"
  cp -ar $srcdir/build/include/* $pkgdir/usr/include/libobase/
  msg "copying license file"
  cp $srcdir/obase/LICENSE $pkgdir/usr/share/licenses/libobase/
}
