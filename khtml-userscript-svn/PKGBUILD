pkgname=khtml-userscript-svn
pkgver=1057092
pkgrel=1
pkgdesc="Greasemonkey for Konqueror"
arch=('i686' 'x86_64')
url="http://kde.org/"
license=('GPL')
makedepends=('cmake' 'automoc4' 'svn')
depends=('kdebase-konqueror')

_svntrunk="svn://anonsvn.kde.org/home/kde/trunk/playground/utils/khtml_userscript"
_svnmod="khtml_userscript"

build() {
cd $srcdir
if [ -d $_svnmod/.svn ]; then
   (cd $_svnmod && svn up)
else
   svn co $_svntrunk $_svnmod
fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

cmake . -DCMAKE_INSTALL_PREFIX=/usr
make PREFIX=/usr || return 1
make DESTDIR=$startdir/pkg install || return 1

rm -r $srcdir/$_svnmod-build
}