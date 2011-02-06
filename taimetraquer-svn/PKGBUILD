# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=taimetraquer-svn
pkgver=1149837
pkgrel=1
pkgdesc="A plamsa widget to track the use of time like gtimelog"
url="http://liveblue.wordpress.com/2010/07/14/back-from-finland-new-plasmoid-in-playground/"
license=(GPL)
arch=('i686')
depends=('kdebase-workspace')
makedepends=('cmake' 'subversion')
conflicts=()
provides=()
source=()
md5sums=()

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/base/plasma/applets/taimetraquer"
_svnmod="taimetraquer"

build() {
   cd ${srcdir}

   msg "Connecting to SVN server...."

   if [ -d ${_svnmod}/.svn ]; then
     (cd ${_svnmod} && svn up -r $pkgver)
   else
     svn co ${_svntrunk} --config-dir ./ -r $pkgver ${_svnmod}
   fi

   msg "SVN checkout done or server timeout"
   msg "Starting make..."

   svn export ${_svnmod} ${_svnmod}-build
   cd ${_svnmod}-build

   cmake -DCMAKE_INSTALL_PREFIX=/usr
   make || return 1
   make DESTDIR=$pkgdir install || return 1

   rm -rf ${srcdir}/${_svnmod}-build
}
