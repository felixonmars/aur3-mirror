# Maintainer: Aris Synodinos <arissynod-gmail-com>

pkgname=('wstool-git')
pkgver=0.0.1
pkgrel=1
pkgdesc="Command-line tools for maintaining a workspace of projects from multiple version-control systems"
arch=('i686' 'x86_64')
url="https://github.com/vcstools/wstool"
license=('BSD')
depends=('python2' 'python2-yaml')
makedepends=(python2-distribute)
optdepends=()
provides=(wstool)
conflicts=(wstool)
md5sums=() #generate with 'makepkg -g'

_gitroot=("https://github.com/vcstools/wstool.git")
_gitname=("wstool")

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
