# Contributor: HuangXi <huaihuaixiaoshao@gmail.com>

pkgname=kdeplasma-applets-konsole-svn
pkgver=18
pkgrel=1
pkgdesc="A simple plasmoid embedding a konsole"
arch=('i686' 'x86_64')
url="http://code.google.com/p/konsole-plasmoid"
license=('GPL')
depends=('kdebase-workspace' 'kdebase-konsole')
makedepends=('subversion' 'cmake' 'automoc4')
conflicts=('konsole-plasmoid-svn')
replaces=('konsole-plasmoid-svn')

_svntrunk="http://konsole-plasmoid.googlecode.com/svn/trunk/"
_svnmod=konsolator

build() {
  msg "Connecting to SVN server...."

  if [ -d "$_svnmod/.svn" ]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi
  
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  
  rm -rf "${srcdir}"/build
  mkdir "${srcdir}"/build
  cd "${srcdir}"/build
  cmake ../${_svnmod} \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package(){
  cd build
  make DESTDIR="${pkgdir}" install
}