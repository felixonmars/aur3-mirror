# Contributor: shamrok <szamrok@gmail.com>

pkgname=kdelaystart
pkgver=0.1
pkgrel=2
pkgdesc="KDelayStart lets you specify some commands to launch (with delay) when KDE starts."
url="http://kde-apps.org/content/show.php/KDelayStart?content=61102"
depends=('kdelibs')
makedepends=('unsermake')
source=("http://www.kde-apps.org/CONTENT/content-files/61102-$pkgname-$pkgver.tar.gz")
md5sums=('e2b327fa72f88c52d95dae543edaad2f')
arch=('i686')
license=('GPL')

build() {
  cd $startdir/src/$pkgname
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
