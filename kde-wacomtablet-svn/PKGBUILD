# Maintainer: Dany Martineau <dany.luc.martineau at gmail.com}

pkgname=kde-wacomtablet-svn
pkgver=1192265
pkgrel=1
url="http://www.kde-apps.org/content/show.php/kcm+tablet?content=114856&PHPSESSID=25cb223ad559721559c462fa6deb1f1a"
pkgdesc="This module implements a GUI for the Wacom Linux Drivers and extends it with profile support to handle different button / pen layouts per profile."
license=('GPL2')
arch=('x86_64' 'i686')
depends=('kdelibs')
makedepends=('cmake' 'automoc4')
conflicts=('kcm_tablet' 'kcm_tablet-svn')

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/kdereview/
_svnmod=wacomtablet-kdereview

build() {
  cd ${srcdir}

  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn revert -R .)
    (cd ${_svnmod} && svn -r ${pkgver} up)
  else
    svn co ${_svntrunk} --config-dir ./ -r ${pkgver} ${_svnmod}
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf build
  mkdir build
  cd build

  cmake ../${_svnmod} \
    -DCMAKE_BUILD_TYPE=fulldebug \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON

  cd wacomtablet/
  make
  make DESTDIR=${pkgdir} install 
}

