# Contributor: George Averill <nhjm449@gmail.com>

pkgname=maxemumtvguide
pkgver=7.3.2
pkgrel=5
pkgdesc="Maxemum TV-Guide is a KDE TV-guide."
arch=('i686' 'x86_64')
url="http://mtvg.sourceforge.net/"
license="GPL"
depends=('xmltv' 'qt3' 'kdelibs3')
source=(http://downloads.sourceforge.net/project/mtvg/mtvg/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('b83e1bfb41ad182c0d944abb10f1ec17')

build() {
  cd $startdir/src/$pkgname-$pkgver
  LDFLAGS=-L/opt/kde/lib ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --with-qt-includes=/opt/qt/include --with-qt-libraries=/opt/qt/lib --without-arts
  make || return 1
  make DESTDIR=$startdir/pkg install
}

