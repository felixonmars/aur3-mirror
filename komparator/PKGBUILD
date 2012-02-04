# Contributor: shamrok <szamrok@gmail.com>

pkgname=komparator
pkgver=0.9
pkgrel=1
pkgdesc="An application for KDE 3.x that searches and synchronizes two directories."
arch=('i686')
url="http://sourceforge.net/projects/komparator"
license=('GPL')
depends=('kdelibs')
source=(http://downloads.sourceforge.net/sourceforge/komparator/$pkgname-$pkgver.tar.bz2)
md5sums=('42c635b876080fe9ab88b3f7a2170cee')

build() {
  source /etc/profile.d/qt3.sh
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
