# Contributor: Kostin Dmitrij [DsTr] <kostindima@gmail.com>

pkgname=doxygen2qthelp
pkgver=702
pkgrel=1
pkgdesc="A tool that teams up with Doxygen to produce .qch files (Qt Compressed Help) for use with Qt Assistant"
arch=('i686' 'x86_64')
url="http://qutim.org"
license=('GPL')
makedepends=('subversion' 'qutim-core-svn')
depends=(qt)
conflicts=()
provides=()

qtversion=4.4.3
source=(ftp://ftp.trolltech.com/qt/source/qt-x11-opensource-src-$qtversion.tar.bz2)                              
md5sums=()

_svnmod=doxygen2qthelp
_svntrunk=svn://labs.trolltech.com/svn/documentation/doxygen2qthelp

build() {
 msg "Getting sources from SVN..."
  cd "$srcdir"
  if [ -d $_svnmod/.svn ]; then
    cd $_svnmod && svn up
  else
    svn co $_svntrunk $_svnmod
  fi

 cd $srcdir
 cp -R $_svnmod $_svnmod-build
 cd $_svnmod-build
 msg "SVN checkout done or server timeout"
 msg "Starting make..."

 export QTSRCDIR=../qt-x11-opensource-src-4.4.3
 qmake
 make || return 1

 mkdir $pkgdir/usr/bin/ -p
 install -Dm 755 doxygen2qthelp $pkgdir/usr/bin/ || return 1
 cd ..
 rm -rf $_svnmod-build
}
