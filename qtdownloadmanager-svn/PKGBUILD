# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=qtdownloadmanager-svn
pkgver=14
pkgrel=1
pkgdesc="QtDownloadManager is a frontend for the console download accelerators like axel, proz, wget and others can be integrated."
arch=('i686' 'x86_64')
url="http://www.qt-apps.org/content/show.php/QtDownloadManager+(QDM)?content=115484"
license=('GPL')
depends=('qt4')
makedepends=('subversion')
optdepends=('axel')
source=qtdownloadmanager.desktop
md5sums=('e74c111ceedeb0802cb6a5162e3a7567')

_svntrunk=http://qtdownloadmanager.googlecode.com/svn/trunk
_svnmod=qtdownloadmanager

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"


  cd $srcdir/qtdownloadmanager/QtDownloadManager

  qmake-qt4
  make

  # Binary
  install -Dm755 QtDownloadManager $pkgdir/usr/share/QDM/QtDownloadManager

  # Scripts
  install -Dm644 scripts/wgethelper.sh $pkgdir/usr/share/QDM/scripts/wgethelper.sh

  # Configs
  install -Dm644 configs/defaults $pkgdir/usr/share/QDM/configs/defaults

  # Icons
  install -Dm644 images/icon.png $pkgdir/usr/share/QDM/icon.png

  # Desktop Icon
  install -Dm644 $startdir/qtdownloadmanager.desktop $pkgdir/usr/share/applications/qtdownloadmanager.desktop
  install -Dm644 images/icon.png $pkgdir/usr/share/pixmaps/qtdownloadmanager.png
}