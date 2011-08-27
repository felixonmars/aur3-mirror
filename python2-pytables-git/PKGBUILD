# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-pytables-git
pkgver=20110722
pkgrel=1
pkgdesc="PyTables library for manipulating hdf5 data, git version (liberated pro version)"
arch=('i686' 'x86_64')
url="http://www.pytables.org/moin"
license=('BSD')
depends=('lzo2' 'bzip2' 'python2-numpy' 'hdf5' 'python-numexpr' 'cython')
makedepends=('git')
provides=('python-pytables=2.3b1')
conflicts=('python-pytabes')
options=(!emptydirs)

_gitroot="https://github.com/PyTables/PyTables.git"
_gitname="pytables"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  python2 setup.py install --root="$pkgdir"/ --optimize=1
}

