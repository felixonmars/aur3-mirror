# -*- shell-script -*-
# Maintainer: Eric Schulte <eric.schulte@gmx.com>
# Contributor: Eric Schulte <eric.schulte@gmx.com>
pkgname=feedgnuplot
pkgver=20120711
pkgrel=1
pkgdesc="Pipe-oriented frontend to Gnuplot"
arch=('any')
url="http://github.com/dkogan/feedgnuplot"
license=('GPL')
depends=('perl' 'gnuplot')
makedepends=('git')
provides=(feedgnuplot)
source=()
md5sums=()

_gitroot="git://github.com/dkogan/feedgnuplot.git"
_gitname="feedgnuplot"

build() {
  cd "$srcdir/"

  ## Git checkout
  if [ -d "${srcdir}/${_gitname}" ] ; then
    msg "Git checkout:  Updating existing tree..."
    cd ${_gitname} && git pull origin master
  else
    msg "Git checkout:  Retrieving sources..."
    git clone ${_gitroot} && cd ${_gitname}
  fi
  msg "Checkout completed"
  
  ## Build
  perl Makefile.PL prefix=/usr
  make
}

package() {
  cd "$srcdir/"${_gitname}
    
  make DESTDIR="$pkgdir/" install
}
