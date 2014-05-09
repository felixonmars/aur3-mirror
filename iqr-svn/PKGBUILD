# Maintainer: Benjamin Wild <nimajnebwild@gmail.com>
pkgname=iqr-svn
pkgver=r365
pkgrel=1
pkgdesc="simulator for large scale neural systems"
arch=('i686' 'x86_64')
url="http://iqr.sourceforge.net"
license=('GPL')
groups=()
depends=('qt5-base' 'opencv' 'qt5-svg')
makedepends=('subversion' 'cmake' 'ghostscript' 'latex2html' 'imagemagick' 'lsb-release')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=()

_svntrunk=svn://svn.code.sf.net/p/iqr/code/trunk
_svnmod=iqr-code

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr "$srcdir/$_svnmod/src-qt5"
}

pkgver() {
  cd "$srcdir/$_svnmod"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}


package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
