# Contributor: Carl Mueller  archlinux at carlm e4ward com

pkgname=kdeplasma-applets-wifi-signal-strength-svn
pkgver=1289668
pkgrel=1
pkgdesc="Kdeplasma wifi strength Plasmoid"
arch=('i686' 'x86_64')
url="http://www.kde.org/"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('cmake' 'subversion' 'automoc4')
conflicts=('plasmoid-wifi-signal-strength-svn')
replaces=('plasmoid-wifi-signal-strength-svn')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/wifi-signal-strength/"
_svnmod=wifi-signal-strength

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