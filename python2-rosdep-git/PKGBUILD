# Maintainer: Ken Tossell <ken@tossell.net>
pkgname=python2-rosdep-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Command-line tool for installing system dependencies on a variety of platforms."
url="http://ros.org/doc/api/rosdep2/html/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('python2' 'python2-rosdistro')
provides=('python2-rosdep')
conflicts=('python2-rosdep')
optdepends=()
makedepends=('python2-distribute' 'git')
md5sums=() #generate with 'makepkg -g'

_gitroot=("https://github.com/ros-infrastructure/rosdep.git")
_gitname=("rosdep")

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

