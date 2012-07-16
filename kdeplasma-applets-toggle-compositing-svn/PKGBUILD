# Contributor: Sphax <zecmerquise@gmail.com>

pkgname=kdeplasma-applets-toggle-compositing-svn
pkgver=1283046
pkgrel=1
pkgdesc="A plasmoid to toggle KWin compositing"
arch=('i686' 'x86_64')
url="http://www.kde.org/"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4' 'subversion')
conflicts=('plasmoid-toggle-compositing-svn')
replaces=('plasmoid-toggle-compositing-svn')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/toggle-compositing"
_svnmod="toggle-compositing"

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