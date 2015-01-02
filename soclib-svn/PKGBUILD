# Maintainer: PESCHE Romain <romain.pesche@gmail.com>
pkgname=soclib-svn
pkgver=1
pkgrel=1
pkgdesc="An open platform for virtual prototyping of multi-processors system on chip"
arch=('i386' 'x86_64')
url="https://www.soclib.fr/svn/trunk/soclib"
license=('GPL')
depends=('gcc' 'systemc' 'systemcass-svn' 'sdl' 'python>=2.4' 'xterm')
makedepends=('subversion')
install=('.install')

_svntrunk=$url
_svnmod=soclib

pkgver() {
  cd "$pkgname"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co --config-option servers:global:http-compression=off "$_svntrunk" $_svnmod
  fi

  export PATH=$PATH:$srcdir/$_svnmod/utils/bin

  cd "$srcdir/$_svnmod/utils/src"

  make
  make install

}

package() {
    mkdir -p "$pkgdir/opt/$_svnmod"
    cp -r $srcdir/$_svnmod/* $pkgdir/opt/$_svnmod/
}
