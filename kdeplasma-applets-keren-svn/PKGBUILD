# Contributor: Mladen Pejakovic <pejakm@gmail.com>

pkgname=kdeplasma-applets-keren-svn
pkgver=1284058
pkgrel=1
pkgdesc="A plasmoid to take picture from available webcam"
arch=('i686' 'x86_64')
url="http://websvn.kde.org/trunk/playground/base/plasma/applets/keren/"
license=('GPL' 'LGPL')
depends=('kdebase-workspace' 'gstreamer0.10-base')
makedepends=('cmake' 'automoc4')
provides=('kdeplasma-addons-applets-keren')
conflicts=('kdeplasma-addons-applets-keren' 'kdeplasma-addons-applets-keren-svn')
replaces=('kdeplasma-addons-applets-keren-svn')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/keren/"
_svnmod=keren

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