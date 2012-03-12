# Maintainer: Christian Hesse <mail@eworm.de>

pkgname=x11rdp-git
pkgver=20120312
pkgrel=1
pkgdesc="X.org server with RDP output - git checkout"
url="https://github.com/Magister/x11rdp_xorg71"
arch=('i686' 'x86_64')
license=('GPL')
depends=('xrdp-git')
makedepends=('git')
provides=('x11rdp')
conflicts=('x11rdp')

_gitroot="git://github.com/FreeRDP/xrdp.git"
_gitname="xrdp"

build() {
  cd "${srcdir}"
  msg "Connecting to GIT server...."

  if [ -d ${srcdir}/${_gitname} ] ; then
    cd ${srcdir}/${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"

  msg "Starting make..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -a ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build/xorg/X11R7.6/

  mkdir -p install
  sh buildx.sh ${PWD}/install/

  cd ${srcdir}/${_gitname}-build/xorg/X11R7.6/rdp/
  make
}

package() {
  cd ${srcdir}/${_gitname}-build

  install -D -m755 xorg/X11R7.6/rdp/X11rdp ${pkgdir}/usr/bin/X11rdp
} 
md5sums=()
