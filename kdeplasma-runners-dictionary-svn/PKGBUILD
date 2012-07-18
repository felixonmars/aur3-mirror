# Maintainer: Marvin Frommhold

pkgname=kdeplasma-runners-dictionary-svn
pkgver=1281418
pkgrel=1
pkgdesc="A dictionary krunner plugin"
arch=('i686' 'x86_64')
url="http://blog.jasondonenfeld.com/285"
license=('GPL' 'LGPL' 'FDL')
depends=('kdebase-workspace')
makedepends=('cmake' 'automoc4')
conflicts=('krunner-dictionary-svn')
replaces=('krunner-dictionary-svn')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/kdereview/plasma/runners/dictionary"
_svnmod=dictionary

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