# Maintainer: Aris Synodinos <arissynod @ gmail . com>

pkgdesc='The rosinstall_generator generates rosinstall files containing information about repositories with ROS packages/stacks. '
url='http://www.ros.org/'

pkgname='python2-rosinstall_generator-git'
pkgver='0.0.1'
pkgrel='2'
arch=('i686' 'x86_64')
license=('BSD')
depends=('python2' 'cmake' 'wget' 'vcstools-git' 'git' 'python2-distribute' 'python2-yaml' 'python2-dateutil' 'python2-rosdep-git')

_gitroot=("https://github.com/ros-infrastructure/rosinstall_generator.git")
_gitname=("rosinstall_generator")

build() {
  cd "${srcdir}"
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
  msg "Starting build..."
  cd "${srcdir}/${_gitname}"
  python2 setup.py install --root=$pkgdir --optimize=1
}
md5sums=() #generate with 'makepkg -g'