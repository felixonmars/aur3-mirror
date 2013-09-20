# Maintainer: Aris Synodinos <arissynod-gmail-com>

pkgdesc="ROS - python rosdistro package"
pkgname=python2-rosdistro-git
pkgver=0.0.1
pkgrel=1
arch=('i686' 'x86_64')
url='http://github.com/ros-infrastructure/rosdistro/'
license=('Apache')
depends=('python2')
makedepends=('python2-distribute')
provides=('python2-rosdistro')
conflicts=('python2-rosdistro')
md5sums=() #generate with 'makepkg -g'

_gitroot=("https://github.com/ros-infrastructure/rosdistro.git")
_gitname=("rosdistro")

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
