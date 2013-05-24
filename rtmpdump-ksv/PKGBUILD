# Maintainer: markster <rretskram[at]yahoo.se>
pkgname=rtmpdump-ksv
_gitname=rtmpdump
pkgver=df6c518
pkgrel=1
pkgdesc="A version of rtmpdump-git including numerous patches released by KSV. Forum thread: http://stream-recorder.com/forum/-t16103.html"
arch=('i686' 'x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('openssl')
makedepends=('git')
conflicts=('rtmpdump' 'rtmpdump-svn' 'rtmpdump-git')
provides=('rtmpdump')
source=('git://git.ffmpeg.org/rtmpdump'
        'rtmpdump-ksv.patch')
md5sums=('SKIP'
         '66669e44fa167083c79fd850a88bc750')

pkgver() {
  cd $srcdir/$_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d $srcdir/$_gitname ] ; then
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

  patch -p0 -i $srcdir/rtmpdump-ksv.patch
  make
}

package() {
  cd $srcdir/$_gitname-build
  install -d -m755 "${pkgdir}/usr/lib"
  make prefix=/usr mandir=/usr/share/man DESTDIR="${pkgdir}" install
}
