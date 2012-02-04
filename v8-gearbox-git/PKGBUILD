# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from GIT sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=v8-gearbox-git
pkgver=20110514
pkgrel=1
pkgdesc="A shell for the v8 Javascript engine"
arch=('i686' 'x86_64')
url="https://github.com/eddyb/v8-gearbox"
license=('MIT/X11')
makedepends=('git' 'scons')
depends=('v8' 'libmysqlclient' 'zlib' 'openssl' 'libgl' 'freeglut' 'sdl' 'ncurses')

_gitroot="git://github.com/eddyb/v8-gearbox.git"
_gitname="v8-gearbox"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server...."

  if [ -d ${_gitname} ] ; then
    cd ${_gitname} && git pull origin
    msg "The local files are updated."
  else
    git clone ${_gitroot} ${_gitname}
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/${_gitname}-build
  git clone ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  scons
}

package() {
  install -m 755 -D ${srcdir}/${_gitname}-build/build/gearbox ${pkgdir}/usr/bin/gearbox
  rm -rf ${srcdir}/${_gitname}-build
} 
