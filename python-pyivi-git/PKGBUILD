# Maintainer: Alex Forencich <alex@alexforencich.com>
# Contributor : Alex Forencich <alex@alexforencich.com>
pkgname=python-pyivi-git
pkgver=20121021
pkgrel=1
pkgdesc="Python Interchangeable Virtual Instrument Library"
arch=('any')
url="https://github.com/alexforencich/pyivi"
license=('LGPL')
depends=('python' 'python-numpy')
makedepends=('git')
provides=('python-pyivi')
optdepends=('python-pyvxi11: VXI11 instrument support')

_gitroot='https://github.com/alexforencich/pyivi.git'
_gitname='pyivi'

build() {
  cd "$srcdir"
  msg "Connecting to github.com"

  if [ -d "$_gitname" ] ;then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot"
  fi
  msg "GIT checkout done or server timeout"

  cd "$srcdir/$_gitname"

  git checkout master
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1
}

