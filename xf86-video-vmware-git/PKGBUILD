# $Id$
# Maintainer: Egon Ashrafinia <e.ashrafinia@gmail.com>
# Contibutor: Jan de Groot <jgc@archlinux.org>

pkgname=xf86-video-vmware-git
pkgver=20120327
pkgrel=1
pkgdesc="Git version of the X.org vmware video driver"
arch=(i686 x86_64)
url="http://xorg.freedesktop.org/"
license=('custom')
depends=('libdrm' 'svga-dri')
makedepends=('pkgconfig' 'xorg-server-devel' 'libdrm' 'libx11' 'libxext' 'git')
conflicts=('xf86-video-vmware')
replaces=('xf86-video-vmware')
provides=('xf86-video-vmware=12.0.2')
groups=('xorg-drivers' 'xorg')
options=('!libtool')

_gitroot="git://anongit.freedesktop.org/xorg/driver/xf86-video-vmware"
_gitname=xf86-video-vmware-git

build() {
  msg "Connecting to GIT server...."
  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${srcdir}/${_gitname} && git pull origin master
    msg "Local repository updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi
 
  cd ${srcdir}
  rm -rf ${_gitname}-build
  cp -r ${_gitname} ${_gitname}-build
 
  cd ${_gitname}-build
  ./autogen.sh --prefix=/usr
  make
  make DESTDIR="${pkgdir}" install
 
  cd "${srcdir}/${_gitname}"
  install -m755 -d "${pkgdir}/usr/share/licenses/xf86-video-vmware"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/xf86-video-vmware/"
}
