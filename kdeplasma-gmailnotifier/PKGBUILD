# Mantainer:   Luca Bennati <lucak3@gmail.com>
# Contributor: Gilles CHAUVIN <gcnweb ][ gmail ? com>

pkgname=kdeplasma-gmailnotifier
pkgver=145
pkgrel=1
pkgdesc="A Gmail Notifier plasmoid for KDE"
arch=('i686' 'x86_64')
url="http://gmailnotifier.googlecode.com/"
license=('GPL')
depends=('kdelibs')
makedepends=('cmake' 'automoc4' 'subversion')
conflicts=('kdeplasma-applets-gmailnotifier')
replace=('kdeplasma-applets-gmailnotifier')

_svntrunk=http://gmailnotifier.googlecode.com/svn/trunk/
_svnmod=gmailnotifier

build() {

  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up)
  else
    svn co $_svntrunk/ $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cd $startdir/src/$_svnmod
  mkdir build; cd build

  cmake .. -DCMAKE_INSTALL_PREFIX=`kde4-config --prefix` -DCMAKE_BUILD_TYPE=Release
  make
  make DESTDIR=$pkgdir install
}
