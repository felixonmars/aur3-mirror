# Maintainer: Jonathan Frederickson <silverskullpsu at gmail dot com>

##############################################################
#### The section below can be adjusted to suit your needs ####
##############################################################

# Which branch do you want to build from?
# Default is "master".

_gitbranch="master"

##############################################################

pkgname=udj-desktop-client-git
pkgver=20120626
pkgrel=1
pkgdesc="The official Desktop Player Client for UDJ"
arch=('i686' 'x86_64')
url="http://udjplayer.com/"
license=('GPL2')
depends=('phonon' 'taglib')
makedepends=('git' 'cmake')
provides=('udj-desktop-client-git')
conflicts=('udj-desktop-client')
options=(!strip)

_gitroot="git://github.com/klnusbaum/UDJ-Desktop-Client.git"
_gitname="UDJ-Desktop-Client"

build() {
  cd ${srcdir}
  msg "Connecting to GIT server..."

  if [ -d ${_gitname} ]; then
    cd ${_gitname} && git checkout ${_gitbranch} && git pull origin ${_gitbranch}
  else
    git clone --depth 1 ${_gitroot} -b ${_gitbranch}
  fi

  msg "GIT checkout done or server timeout"

  if [[ -e ${srcdir}/${_gitname}-build ]]; then rm -rf ${srcdir}/${_gitname}-build; fi
  mkdir ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib \
        -DCMAKE_INSTALL_LIBEXECDIR=lib/${_gitname} \
        -DCMAKE_BUILD_TYPE=${_buildtype} \
        ../${_gitname}
  make
}

package() {
  cd ${srcdir}/${_gitname}-build
  make DESTDIR=${pkgdir} install
}

