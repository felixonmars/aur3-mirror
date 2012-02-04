# $Id$
# Maintainer: David C. Rankin <drankinatty@gmail.com>

pkgbase=trinity
pkgname=trinity-kdevelop
pkgver=1221512
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL')
groups=('trinity')
pkgdesc="Trinity - kdevelop"
depends=('python2-sip'
        'libical'
        'libxslt'
        'avahi'
        'dbus-qt3'
        'pam-krb5'
        'hal'
        'trinity-qt3'
        'trinity-pyqt3'
        'trinity-tqtinterface'
        'trinity-arts'
        'trinity-kdelibs'
        'trinity-kdebase')
makedepends=('pkgconfig' 'cmake' 'autoconf' 'subversion' 'imake')
provides=('trinity-kdevelop')
conflicts=('trinity-kdevelop')
replaces=('trinity-kdevelop')
options=('libtool' '!strip')
source=()

_svnmod=kdevelop
_svntrunk="svn://anonsvn.kde.org/home/kde/branches/trinity/${_svnmod}"

build() {

  cd ${srcdir}

  msg "Connecting to SVN server to update or checkout ${_svnmod}...."
  if [ -d ${_svnmod}/.svn ]; then
    (cd ${_svnmod} && svn up)
    [[ $? -eq 0 ]] || _co_failed=1
  else
    (svn co $_svntrunk ${_svnmod})
    [[ $? -eq 0 ]] || _co_failed=1
  fi

  # if update or checkout failed - bail...
  if [[ $_co_failed -ne 1 ]]; then
    msg "SVN checkout of revision $pkgver -- Complete."
  else
    msg "SVN checkout of revision $pkgver -- Failed or server timeout."
    exit 1
  fi

  msg "Setting PATH, CMAKE and Trinity Environment variables"
  export CMAKE_PREFIX_PATH=/opt/qt:/opt/trinity
  CMAKE_INCLUDE_PATH=/opt/qt/include:/opt/qt/include/tqt:/usr/include/dbus-1.0:/opt/trinity/include:/opt/trinity/include/libkrandr
  export LD_LIBRARY_PATH=/opt/trinity/lib:/opt/trinity/lib/kde3:$LD_LIBRARY_PATH
  export PKG_CONFIG_PATH=:/opt/trinity/lib/pkgconfig:/opt/qt/lib/pkgconfig

  cd ${srcdir}/${_svnmod}

  trinity_prefix="/opt/trinity"

  cmake ./ \
    -DCMAKE_INSTALL_PREFIX=${trinity_prefix} \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DWITH_QT3=ON \
    -DQTDIR=/opt/qt \
    -DQT_DOCDIR=/opt/qt/man \
    -DQT_LIBRARY_DIRS=/opt/qt/lib \
    -DBUILD_ALL=ON
  make
}

package() {
  msg "Packaging - $pkgname-$pkgver"
  cd ${srcdir}/${_svnmod}

  make DESTDIR="$pkgdir/" install

#   rm -r ${srcdir}/${_svnmod}
}
