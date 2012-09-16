# Maintainer: Konstantin <nulleight@gmail.com>
pkgname=gtg-svn
pkgver=168
pkgrel=1
pkgdesc="Generic Trace Generator (GTG) aims at providing a simple and generic interface for generating execution traces in several formats (OTF, Paje, etc.)"
arch=('any')
url=('https://gforge.inria.fr/projects/gtg/')
license=('CeCILL-C')
groups=()
depends=(gcc-fortran)
makedepends=('subversion')
provides=(gtg)
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=svn://scm.gforge.inria.fr/svnroot/gtg/trunk
_svnmod=gtg

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

  #
  # BUILD HERE
  #
  autoreconf -vfi
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR="$pkgdir/" install
}
