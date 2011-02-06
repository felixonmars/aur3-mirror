# Contributor: adriano <adriano.src@gmail.com>
pkgname=qalculator
pkgver=0.4
pkgrel=1
pkgdesc="Simple Qt calculator"
arch=('i686' 'x86_64')
url="http://qt-apps.org/content/show.php/Qalculator?content=101326"
license=('GPL')
depends=('qt')
source=(http://qt-apps.org/CONTENT/content-files/101326-qalculator-0.4b-src.tar.bz2)

build() {
  cd "$srcdir/qalculator-0.4b-src"
  qmake
  make || return 1
  install -Dm 755 $srcdir/qalculator-0.4b-src/Qalculator $pkgdir/usr/bin/qalculator  
}
md5sums=('6fc45dbefb99f7f812cea97a094e08dc')
