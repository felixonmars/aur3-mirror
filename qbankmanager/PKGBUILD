# Contributor: Martin < martin dot m dot kuehn at gmx dot net >
pkgname=qbankmanager
pkgver=0.9.52beta
pkgrel=2
pkgdesc="QBankManager is a QT program for simple administration of Online Banking accounts"
arch=('i686' 'x86_64')
url="http://www.aquamaniac.de/aqbanking"
license=('GPL')
depends=('aqbanking>=4.1.0' 'qt3')
source=("$pkgname-$pkgver.tar.gz::http://www2.aquamaniac.de/sites/download/download.php?package=04&release=05&file=01&dummy=$pkgname-$pkgver.tar.gz")
md5sums=('bcef0b21c547de3e326d0158cc986a6a')

build() {
  cd $srcdir/$pkgname-$pkgver

  ./configure --prefix=/usr --with-qt3-libs=/opt/qt/lib --with-qt3-includes=/opt/qt/include
  make || return 1
  make DESTDIR=$pkgdir install
}

