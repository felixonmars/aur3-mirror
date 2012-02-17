# Maintainer: Christopher Rosell <chrippa@gmail.com>
pkgname=rtmpdump-weebtv
pkgver=20120217
pkgrel=1
pkgdesc="A patched version of rtmpdump-git - with  weebtv option. Project homepage http://code.google.com/p/sd-xbmc/"
arch=('i686' 'x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('openssl')
makedepends=('git')
conflicts=('rtmpdump' 'rtmpdump-svn')
provides=('rtmpdump')
source=()
md5sums=()

_gitroot="git://git.ffmpeg.org/rtmpdump"
_gitname="rtmpdump"

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $startdir/src/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  cd $srcdir
  if [ -d $_gitname-build ]; then
    rm -rf $_gitname-build
  fi
  cp -a $_gitname $_gitname-build
  cd $_gitname-build
  
  wget -c http://sd-xbmc.googlecode.com/files/rtmpdump-git20111213-0001-weebtv.patch
  patch -p1 < rtmpdump-git20111213-0001-weebtv.patch
  echo "LIBS_posix=-lm" >> Makefile

  make
}

package() {
  cd $srcdir/$_gitname-build
  install -d -m755 "${pkgdir}/usr/lib"
  make prefix=/usr mandir=/usr/share/man DESTDIR="${pkgdir}" install
}
