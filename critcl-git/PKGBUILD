# Maintainer: Taylor Venable <taylor@metasyntax.net>

pkgname='critcl-git'
pkgver=20130326
pkgrel=1
pkgdesc='Critcl lets you easily embed C code in Tcl'
arch=('i686' 'x86_64')
url='http://andreas-kupries.github.com/critcl/'
license=('BSD')
depends=('tcl>=8.6.0' 'tcllib')
makedepends=('git')
provides=('critcl')
conflicts=('critcl')

_gitroot='git://github.com/andreas-kupries/critcl.git'
_gitname='critcl'

build() {
  cd $startdir/src

  if [[ -d $startdir/src/$_gitname ]]; then
    cd $_gitname && git pull origin
  else
    git clone $_gitroot
  fi

  # Make a copy of the source code so we can build there and keep the other
  # source directory (which we will update in subsequent builds) clean.

  rm -rf "${srcdir}/${_gitname}-build"
  git clone -l "${srcdir}/${_gitname}" "${srcdir}/${_gitname}-build"
}

package() {
  cd "${srcdir}/${_gitname}-build"

  tclsh build.tcl install "$pkgdir/usr/lib/tcl8.6"
}
