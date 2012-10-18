# Maintainer: Alex Forencich <alex@alexforencich.com>
# Contributor : Alex Forencich <alex@alexforencich.com>
pkgname=python-pyvxi11-git
pkgver=20121018
pkgrel=1
pkgdesc="A Python VXI-11 driver for controlling instruments over Ethernet."
arch=('any')
url="https://github.com/alexforencich/pyvxi11"
license=('LGPL')
depends=('python')
makedepends=('git')
provides=('python-pyvxi11')

_gitroot='https://github.com/alexforencich/pyvxi11.git'
_gitname='pyvxi11'

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

