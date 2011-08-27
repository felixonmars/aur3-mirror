pkgname=python-pybrain-git
pkgver=20100815
pkgrel=1
pkgdesc="Modular Machine Learning Library for Python"
arch=('any')
url="http://pybrain.org/"
license=('BSD')
depends=('python>=2.5' 'python-scipy>=0.6')
optdepends=('python-matplotlib: for plotting')
makedepends=('git')
conflicts=()
provides=()
source=()
md5sums=()

_gitroot="git://github.com/pybrain/pybrain.git"
_gitname="pybrain"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  python setup.py install --root="$pkgdir/" --optimize=1 || return 1
} 

