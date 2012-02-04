#Contributor: fancris3 <fancris3 at aol.com>

pkgname=kooldock-svn
pkgver=51
pkgrel=2
arch=('i686' 'x86_64')
license="GPL"
pkgdesc="A kool dock for KDE. It attemps to resemble the Mac OSX dock. "
url="http://www.kde-apps.org/content/show.php/kooldock?content=50910"
depends=('kdebase')
makedepends=('subversion' 'autoconf')
source=()
md5sums=()

_svntrunk=https://kooldock.svn.sourceforge.net/svnroot/kooldock
_svnmod=kooldock

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  make -f Makefile.cvs
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install

  rm -rf $startdir/src/$_svnmod-build
}
