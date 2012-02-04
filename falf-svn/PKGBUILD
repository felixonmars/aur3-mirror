# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=falf-svn
pkgver=292
pkgrel=1
pkgdesc="Development version of a music player for KDE3 (based on Xine)"
arch=('i686')
url="http://falf.sourceforge.net/"
license=('GPL')
depends=('kdelibs3' 'taglib' 'qt3' 'xine-lib')
makedepends=('findutils' 'patch' 'subversion' 'sqlite3')
provides=('falf')
conflicts=('falf')

source=($pkgname-build.patch)
sha256sums=('8edc7764c463a829501b9588378c0188654e3335f96a910351a3ecbe955d00c0')

_svntrunk=https://falf.svn.sourceforge.net/svnroot/falf
_svnmod=falf

build() {
# !!! if ERRORS or using KDEmod uncomment next 2 lines !!!
#  export QTDIR=/opt/qt
#  export QMAKESPEC=/opt/qt/mkspecs/linux-g++

  cd $srcdir

# get the sources
  msg "Connecting to $_svntrunk ..."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver) || return 1
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod || return 1
  fi
  msg "SVN checkout done or server timeout"

  if [ -d ${_svnmod}-build ]; then
    msg "Deleting old build directory"
    rm -rf ${_svnmod}-build
  fi
  cp -r ${_svnmod} ${_svnmod}-build || return 1
  cd ${_svnmod}-build
  msg "Setting up build environment..."

# building
  msg "Starting build"
  install -d ${pkgdir}/opt/kde/bin \
    ${pkgdir}/opt/kde/share/locale/{cs,es,it,nl,pl,ru,uk,zh_CN}/LC_MESSAGES/ \
    ${pkgdir}/opt/kde/share/{applnk/Multimedia,apps/konqueror/servicemenus,icons/default.kde}

#  sed -i 's:$(kde-config --prefix):$(cd ../../pkg/opt/kde && pwd):' install.sh
  patch -Np0 -i $srcdir/$pkgname-build.patch
  sh install.sh

# correcting file permissions
  find ${pkgdir}/opt/kde/share -type f -exec chmod 644 "{}" \;

# remove all svn related files installed
  rm -rf `find ${pkgdir} -type d -name .svn`

  rm -rf $srcdir/$_svnmod-build
}
