# Maintainer: Wouter Haffmans <wouter@simply-life.net>
pkgname=doxygen-svn
pkgver=834
pkgrel=1
pkgdesc="A documentation system for C++, C, Java, IDL and PHP - svn version"
arch=('i686', 'x86_64')
url="http://www.stack.nl/~dimitri/doxygen"
license=('GPL2')
groups=()
depends=()
makedepends=('subversion' 'perl' 'flex' 'bison')
optdepends=('graphviz')
provides=('doxygen')
conflicts=('doxygen')
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://doxygen.svn.sourceforge.net/svnroot/doxygen/trunk
_svnmod="doxygen"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server..."

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

  ## Note: doxywizard cannot be enabled currently, due to a bug
  ## in its Makefile!
  # ./configure --prefix /usr --with-doxywizard
  ./configure --prefix /usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:

