# Maintainer: Aris Synodinos <arissynod-gmail-com>

pkgname=python2-rospkg-git
pkgver=0.0.1
pkgrel=1
pkgdesc="ROS - provides basic utilities for querying information about ROS packages, stacks, and distributions."
url="http://ros.org/wiki/rospkg"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=(python2-rospkg)
provides=(python2-rospkg)
md5sums=() #generate with 'makepkg -g'

_gitroot=("https://github.com/ros-infrastructure/rospkg.git")
_gitname=("rospkg")

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
  python2 setup.py install --root=${pkgdir} --optimize=1 || return 1
}
