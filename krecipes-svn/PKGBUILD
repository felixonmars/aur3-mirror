# Contributor: Košava <kosava@gmail.com>
pkgname=krecipes-svn
pkgver=1192030
pkgrel=1
pkgdesc="QT4 Program to manage recipes database (with sqlite and mysql support)"
arch=('i686' 'x86_64')
url="http://krecipes.sourceforge.net/"
license=('GPL')
depends=('sqlite3' 'kdebase-runtime' 'qimageblitz' 'hicolor-icon-theme')
makedepends=('cmake' 'automoc4' 'docbook-xsl')
optdepends=('mysql' 'postgresql')
provides=('krecipes')
conflicts=('krecipes')
replaces=('krecipes')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/extragear/utils/krecipes/"
_svnmod=krecipes_kde4

build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi
  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $_svnmod

  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
  make DESTDIR=$pkgdir install
  cd .. && rm -rf build
}