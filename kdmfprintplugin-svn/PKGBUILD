# Contributor: Nikolay Rysev <mad.f3ka@gmail.com>
pkgname=kdmfprintplugin-svn
pkgver=1227058
pkgrel=1
pkgdesc="KDM plugin which can use fingerprint to login"
arch=('i686' 'x86_64')
url="http://www.kde.org"
license=('GPL')
depends=('kdelibs' 'libfprint' 'pam_fprint' 'libusb' 'fprintd')
makedepends=('pkgconfig' 'cmake' 'automoc4' 'subversion' 'cmake')
install=kdmfprintplugin.install
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/kfingerprint/KDMFprintPlugin
_svnmod=kdmfprintplugin

build() {
  cd $srcdir
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  mkdir $_svnmod-build
  cd $_svnmod-build
  cmake $srcdir/$_svnmod \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/$_svnmod-build
  make DESTDIR=${pkgdir} install
  rm -rf $srcdir/$_svnmod-build
}
