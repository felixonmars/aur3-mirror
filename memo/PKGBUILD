# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=memo
pkgver=0.1
pkgrel=3
pkgdesc="Enhancing ability to remember foreign words and phrases by regular repetition"
arch=("i686" "x86_64")
license=('GPL3')
url="http://www.nongnu.org/memo"
depends=('perl' 'mailx' 'sqlite3' 'procmail')
conflicts=('memo-notes')
source=("http://download.savannah.nongnu.org/releases/memo/$pkgname-$pkgver.tar.gz")
md5sums=('6caae1c96c10f61511c35ed5cc3bac5a')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
  rm $pkgdir/usr/share/info/dir
}
