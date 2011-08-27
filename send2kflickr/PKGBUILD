# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=send2kflickr
pkgver=0.1
pkgrel=2
pkgdesc="Digikam plugin that integrates kflickr"
url="http://kflickr.sourceforge.net/wikka.php?wakka=Send2KFlickr"
license=('GPL')
arch=('i686')
depends=('digikam' 'kflickr' 'libkipi')
source=("http://prdownloads.sourceforge.net/kflickr/send2kflickr-$pkgver.tar.bz2")
md5sums=('c369ba3866345199e7155ba326447429')

build() {
  . /etc/profile.d/qt.sh
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
