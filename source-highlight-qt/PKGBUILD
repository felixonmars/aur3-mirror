# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=source-highlight-qt
pkgver=0.2.2
pkgrel=3
pkgdesc="A library for performing syntax highlighting in Qt documents by relying on GNU Source-Highlight library,"
arch=('i686' 'x86_64')
url="http://srchiliteqt.sourceforge.net/"
license=("GPL")
depends=(qt source-highlight boost)
source=(http://downloads.sourceforge.net/project/srchiliteqt/source-highlight-qt/source-highlight-qt-$pkgver.tar.gz)

build() {
  cd $startdir/src/$pkgname-$pkgver
#   ./configure --prefix=/usr --enable-qt4
  qmake
  make || return 1
  make INSTALL_ROOT=$startdir/pkg/usr install || return 1
  rm -rf $startdir/pkg/usr/demos
}
md5sums=('a77653c3c035822fa238d4a4fac3f772')
