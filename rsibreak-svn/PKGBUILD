# Contributor: Dmytro Kostiuchenko <edio@gmx.us>
# Maintainer: Dmytro Kostiuchenko <edio@gmx.us>

pkgname=rsibreak-svn
pkgver=1138161
pkgrel=1
pkgdesc="RSIBreak simply offers reminders to take a break now and then"
arch=(i686 x86_64)
url="http://www.rsibreak.org/"
license=('GPL')
depends=('libxss' 'kdelibs' 'oxygen-icons')
makedepends=('automoc4' 'subversion')
options=('libtool')
provides=('rsibreak')
conflicts=('rsibreak')

source=()
md5sums=()

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/extragear/utils/rsibreak
_svnmod=rsibreak

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=${pkgdir} install

  rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh
