# Contributor: Alex Babescu <alex.babescu@gmail.com>
pkgname=shogun-git
pkgver=20110407
pkgrel=1
pkgdesc="Shogun - A Large Scale Machine Learning Toolbox"
arch=('i686' 'x86_64')
url="http://www.shogun-toolbox.org"
license=('GPLv3')
depends=('python2' 'python2-numpy' 'swig' 'hdf5' 'blas' 'lapack')
makedepends=('git' 'python2' 'lzo2' 'glpk' 'gcc' 'make' 'pkg-config' 'libxml2')
optdepends=('atlas-lapack' 'octave' 'doxygen' 'r')
provides=('shogun')
source=()
md5sums=()

_gitroot="git://github.com/shogun-toolbox/shogun.git"
_gitname="shogun"

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
  
  # python2 fix
  sed -i 's/PYTHON=python/PYTHON=python2/g' src/configure
  sed -i -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
    -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
    $(find ./ -name '*.py')

  cd src
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname-build/src"
  make DESTDIR="$pkgdir/" install
} 
