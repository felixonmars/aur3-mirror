# Contributor: Kevin Whitaker <eyecreate@gmail dot com>

pkgname=kdevelop-extra-plugins-qtdesigner-svn
pkgver=1097867
pkgrel=1
pkgdesc="Kdevelop Qtdesigner plugin"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.kdevelop.org"
depends=('kdevelop')
makedepends=('automoc4' 'cmake' 'subversion' 'qt' )
provides=('kdevelop-extra-plugins-qtdesigner-svn')
conflicts=('kdevelop-extra-plugins-qtdesigner-svn')
source=()
md5sums=()
_svntrunk=svn://anonsvn.kde.org/home/kde/trunk/playground/devtools/kdevelop4-extra-plugins/qtdesigner
_svnmod=qtdesigner

build() {
svn co -r $pkgver $_svntrunk $_svnmod
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
     cd ${srcdir}/$_svnmod
cmake -DCMAKE_INSTALL_PREFIX=/usr .|| return 1
make || return 1
make DESTDIR="$pkgdir" install || return 1
rm -rf ${srcdir}/$_svnmod
}
 
