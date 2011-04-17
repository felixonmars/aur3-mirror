# Maintainer:  Martin Lee < hellnest.fuah [at] gmail [dot] com>

pkgname=xf86-sis-m671
pkgver=20110417
pkgrel=1
pkgdesc="Driver for SIS M671 Chipset - Git Version"
url="http://github.com/hellnest/xf86-video-sismedia-0.9.1"
arch=('i686' 'x86_64')
license=('MIT')
depends=('glibc')
makedepends=('pkg-config' 'xorg-server>=1.0.99.901' 'xf86driproto' 'xf86dgaproto' 'xproto' 'fontsproto' 'mesa' 'glproto' 'xineramaproto' 'xorg-server-devel' 'git')
provides=('xf86-video-sis')
conflicts=('xf86-video-sis')

_gitroot=git://github.com/hellnest/xf86-video-sismedia-0.9.1.git
_gitname=xf86-video-sismedia-0.9.1

build() {
  cd $srcdir
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/$_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
    cd $_gitname
  fi

  msg "GIT checkout done"

  ./configure --prefix=/usr --disable-static

  msg "Starting make..."
  make || return 1
  mkdir -p "${pkgdir}/usr/lib/xorg/modules/drivers"  || return 1
  cp src/.libs/sis_drv.so "${pkgdir}/usr/lib/xorg/modules/drivers"  
}
