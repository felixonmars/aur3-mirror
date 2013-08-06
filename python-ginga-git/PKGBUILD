# Maintainer:  <clu@nimbus>

pkgname=python-ginga-git  
pkgver=20130806
pkgrel=1 
pkgdesc="A viewer for astronomical data FITS (Flexible Image Transport System) files."
url="http://ejeschke.github.io/ginga/"
arch=('i686' 'x86_64')
license=('MIT')
depends=(python)
makedepends=('git')
conflicts=()
replaces=()
backup=()
#source=($pkgname-$pkgver.tar.gz)
source=()
md5sums=()

_gitroot='git://github.com/ejeschke/ginga.git'
_gitname=('ginga')

build() {
  cd ${srcdir}

  # GIT
  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"

  #cd ${_gitname}
  pwd
  python setup.py build
}

package() {
  cd ${srcdir}/${_gitname}
  python setup.py install --root=${pkgdir}
}
