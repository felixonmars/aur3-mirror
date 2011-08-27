# Contributor: Dmytro Kostiuchenko <edio@gmx.us>
# Maintainer: Dmytro Kostiuchenko <edio@gmx.us>
arch=(i686 x86_64)
pkgname=plasma-globalmenu
pkgver=1013055
pkgrel=3
pkgdesc="Said to provide GTK+ support for Bespin Xbar"
url="http://websvn.kde.org/trunk/playground/base/plasma/globalmenu/"
license="GPL"
depends=('kdebase-workspace' 'bespin-svn' 'gnome-globalmenu')
makedepends=('subversion' 'cmake' 'automoc4')
options=('!strip')

source=(globalmenu.diff)
md5sums=(4b1f908e7a912d4d8d24aecfd231d833)

_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/globalmenu
_svnmod=plasma-globalmenu

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
  patch -Np1 -i ../globalmenu.diff
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make || return 1
  make DESTDIR=${pkgdir} install

  rm -rf ${srcdir}/$_svnmod-build
}
# vim:syntax=sh
