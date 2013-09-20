# Maintainer: Aris Synodinos <arissynod-gmail-com>
pkgname='python2-catkin_pkg-git'
pkgdesc="ROS - Low-level build system macros and infrastructure for ROS."
url='http://www.ros.org/'
pkgver='0.0.1'
arch=('i686' 'x86_64')
pkgrel=1
license=('BSD')
makedepends=()
provides=('python2-catkin_pkg')
conflicts=('python2-catkin_pkg')
md5sums=() #generate with 'makepkg -g'

_gitroot=("https://github.com/ros-infrastructure/catkin_pkg.git")
_gitname=("catkin_pkg")

build() {
  cd ${srcdir}
  msg "Connecting to Git server..."

  # Git checkout
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"
}

package() {
  msg "Starting Build..."
  cd ${srcdir}/${_gitname}
  python2 setup.py install --root=${pkgdir} || return 1
}