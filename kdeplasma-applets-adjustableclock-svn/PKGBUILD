# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=kdeplasma-applets-adjustableclock-svn
pkgver=1280484
pkgrel=1
pkgdesc="Clock with the facility of adjusting the time and date format"
arch=('i686' 'x86_64')
url="http://kde-look.org/content/show.php?content=92825"
license=('GPL')
depends=('kdebase-workspace')
makedepends=('subversion' 'cmake' 'automoc4')
conflicts=('kdeplasma-applets-adjustableclock')
provides=('kdeplasma-applets-adjustableclock')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/kdereview/plasma/applets/adjustableclock"
_svnmod=adjustableclock

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
