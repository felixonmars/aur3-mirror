# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/VCS_PKGBUILD_Guidelines
# for more information on packaging from SVN sources.

# Maintainer: Your Name <youremail@domain.com>
pkgname=g2o-svn
pkgver=23
pkgrel=2
pkgdesc="A General Framework for Graph Optimization"
arch=('i686' 'x86_64')
url="http://openslam.org/g2o.html"
license=('LGPLv3')
groups=()
depends=('suitesparse' 'qt4')
makedepends=('subversion' 'cmake')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=()
noextract=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://svn.openslam.org/data/svn/g2o/trunk
_svnmod=g2o

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
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD HERE
  #
  mkdir -p build;cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$_svnmod-build"
  mkdir -p $pkgdir/usr/lib 
  mkdir -p $pkgdir/usr/bin
  install -m644 lib/* $pkgdir/usr/lib  
  install -m644 bin/* $pkgdir/usr/bin  
}


