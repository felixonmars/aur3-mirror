# Maintainer: Aris Synodinos <arissynod-gmail-com>

pkgname=python-brotherhood_solver-git
pkgver='git'
pkgrel=1
pkgdesc="This is a cross plattform client for the Captcha Brotherhood network. Its main feature is the ability to solve captchas in Linux."
url="https://github.com/thammi/brotherhood-solver"
arch=('any')
license=('BSD')
depends=('python' 'python-pyqt4')
makedepends=('python-distribute')
md5sums=() #generate with 'makepkg -g'

_gitroot=("https://github.com/thammi/brotherhood-solver")
_gitname=("brotherhood-solver")

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
  python setup.py install --root=${pkgdir} || return 1
}
