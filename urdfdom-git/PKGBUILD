# Maintainer: Aris Synodinos <arissynod-gmail-com>
pkgname=urdfdom-git
pkgver=1
pkgrel=1
pkgdesc="The URDF (U-Robot Description Format) library provides core data structures and a simple XML parsers for populating the class data structures from an URDF file"
arch=('i686' 'x86_64')
url="http://gazebosim.org/"
license=('Apache')
depends=( 'boost' 'tinyxml' 'console_bridge' 'urdfdom_headers')
provides=('urdfdom')
conflicts=('urdfdom')
makedepends=('git' 'cmake')
md5sums=() #generate with 'makepkg -g'

_gitroot=https://github.com/ros/urdfdom
_gitname=urdfdom

build() {
  cd "${srcdir}"
  msg "Connecting to Git server...."

  ## Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"

  msg "Starting build..."

  rm -rf ${srcdir}/${_gitname}-build
  cp -r ${srcdir}/${_gitname} ${srcdir}/${_gitname}-build
  cd ${srcdir}/${_gitname}-build

  #
  # BUILD HERE
  #
  mkdir ${srcdir}/${_gitname}-build/build
  cd ${srcdir}/${_gitname}-build/build
  cmake .. -DCMAKE_INSTALL_PREFIX="/usr"
}

package() {
  cd "$srcdir/${_gitname}-build/build"
  make DESTDIR="$pkgdir/" install
}