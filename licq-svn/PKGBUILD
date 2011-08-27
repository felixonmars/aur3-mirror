# Contributor: Bruce56 <robert.sesztak at gmail dot com>

pkgname=licq-svn
pkgver=7352
pkgrel=1
pkgdesc="Advanced graphical ICQ clone and more for Unix with GPG support"
arch=('i686' 'x86_64')
url="http://www.licq.org"
license=('GPL')
depends=('libxss' 'qt>=4.3.2' 'openssl' 'boost>=1.31.1' 'gpgme')
makedepends=('subversion' 'automake' 'cmake>=2.4.2')
conflicts=('licq')
provides=('licq')
source=()
md5sums=('')

_svntrunk=http://svn.licq.org/svn/branches/1.3-stable/licq
_svnmod=licq

build() {
  cd ${startdir}/src
  svn co ${_svntrunk} -r ${pkgver}
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  cp -r ${_svnmod}  ${_svnmod}-build
  cd ${_svnmod}-build

  make -f Makefile.cvs
  GPGME_CONFIG=/usr/bin/gpgme-config ./configure --prefix=/usr
  make || return 1
  make DESTDIR=${startdir}/pkg install

  cd plugins/qt4-gui
  mkdir build
  cd build
  cmake -DWITH_KDE=OFF -DCMAKE_INSTALL_PREFIX=/usr ..
  make || return 1
  make DESTDIR=${startdir}/pkg install
}
