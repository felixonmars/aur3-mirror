pkgname=kdeplasma-applets-keyboardleds-svn
pkgver=1239981
pkgrel=1
pkgdesc="Desktop display for LED status, for wireless keyboards without leds"
arch=('i686' 'x86_64')
url="http://www.kde.org/"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('automoc4' 'subversion' 'cmake')
provides=('kdeplasma-keyboardleds')
conflicts=('kdeplasma-keyboardleds' 'kdeplasma-keyboardleds-svn')
replaces=('kdeplasma-keyboardleds-svn')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/keyboardLeds"
_svnmod=keyboardleds

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