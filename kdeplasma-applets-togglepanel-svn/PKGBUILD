# Maintainer: Adrian Berriel <berriel[at]gmail[dot]com>

pkgname=kdeplasma-applets-togglepanel-svn
pkgver=1239981
pkgrel=1
pkgdesc="Plasma applet to toggle visibility of a panel"
arch=('i686' 'x86_64')
url="http://websvn.kde.org/trunk/playground/base/plasma/applets/togglepanel/"
license=('LGPL')
depends=('kdebase-workspace')
makedepends=('automoc4' 'subversion' 'cmake')
provides=('kdeplasma-applets-togglepanel')
conflicts=('kdeplasma-addons-applets-togglepanel' 'kdeplasma-addons-applets-togglepanel-svn')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/togglepanel"
_svnmod=togglepanel

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