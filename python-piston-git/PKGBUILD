# Maintainer: Michael Sierks <msierks117@gmail.com>
pkgname=python-piston-git
pkgver=20130924
pkgrel=1
pkgdesc="A full-stack web framework optimized for rapid development and developer happiness"
arch=('i686' 'x86_64')
url="https://github.com/pythonpiston/piston"
license=('MIT')
depends=('python' 'python-ply' 'python-jinja' 'python-yaml')
makedepends=('git' 'python-distribute')

_gitroot="git://github.com/pythonpiston/piston.git"
_gitname="piston"

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
  msg "Starting build..."

  cd "$srcdir/$_gitname"
  python setup.py build
}


package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir"
}
