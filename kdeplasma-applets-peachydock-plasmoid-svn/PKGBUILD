# Contributor: Nick B <Shirakawasuna at gmail dot com>

pkgname=kdeplasma-applets-peachydock-plasmoid-svn
pkgver=1283046
pkgrel=1
pkgdesc="A complete rewrite of PrettyTasks that eventually bring complete OS-X Dock like functionality to the KDE/Plasma Desktop"
arch=('i686' 'x86_64')
url="http://www.kde-look.org/content/show.php/PeachyDock?content=78494"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('subversion' 'cmake' 'automoc4')
conflicts=('peachydock-plasmoid' 'peachydock-plasmoid-svn')
replaces=('peachydock-plasmoid' 'peachydock-plasmoid-svn')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/peachydock"
_svnmod=peachydock

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