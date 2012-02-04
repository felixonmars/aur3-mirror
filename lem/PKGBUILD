# Maintainer: Atmashkin M.I. <AtmashkinMI@gmail.com>

pkgname=lem
pkgver=0.11.11
pkgrel=1
pkgdesc="Securely erases sensitive information in Linux"
arch=('i686' 'x86_64')
url=("https://github.com/AtmashkinMI/LEM")
license=('GPL3')
makedepends=('git')
depends=('qt>=4.7' 'linux>=3.0.0' 'gksu')
optdepends=('nautilus-actions: for nautilus integration support')
_gitroot=("https://github.com/AtmashkinMI/LEM.git")
_gitname=("LEM")

build() {
  cd ${srcdir}

  if [ -d ${srcdir}/${_gitname} ] ; then
    msg "Git checkout:  Updating existing tree"
    cd ${_gitname} && git pull origin
    msg "Git checkout:  Tree has been updated"
  else
    msg "Git checkout:  Retrieving sources"
    git clone ${_gitroot}
  fi
  msg "Checkout completed"

  cd ${srcdir}/${_gitname}

  msg "Starting make..."
  qmake || return 1
  make || return 1
}

package() {
  cd ${srcdir}/${_gitname}
  
  make install INSTALL_ROOT=${pkgdir} || return 1
}
