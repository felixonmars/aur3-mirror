# Contributor:  Leslie P. Polzer <polzer@gnu.org>
pkgname=klogoturtle
pkgver=0.6
pkgrel=2
pkgdesc="Multilingual KDE turtle simulator"
arch=('i686' 'x86_64')
url="http://klogoturtle.sourceforge.net/"
license=('GPL')
depends=('kdelibs')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=(http://klogoturtle.sourceforge.net/$pkgname-$pkgver.tar.gz)
md5sums=('5d79f041cab3bac9916ef7ae2f9d7cf0')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde --with-qt-dir=/opt/qt --with-qt-includes=/opt/qt/include --with-qt-libraries=/opt/qt/lib --enable-libsuffix=''
  make || return 1
  make DESTDIR=$startdir/pkg install
  find $startdir/pkg -name "*.la" -exec rm -f '{}' \;
}
