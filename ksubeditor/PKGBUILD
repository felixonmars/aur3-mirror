# Contributor: DessislavPetrov (DesislavPetrov@gmail.com)

pkgname=ksubeditor
pkgver=0.2
pkgrel=1
pkgdesc="A subtitle editor"
depends=('kdelibs')
arch=('i686' 'x86_64')
source=(http://dl.sourceforge.net/sourceforge/ksubeditor/$pkgname-$pkgver.tar.gz)
url="http://sourceforge.net/projects/ksubeditor/"
md5sums=('ddfb1c2ad888127835df09e5479b438d')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/opt/kde
  make || return 1
  make DESTDIR=$startdir/pkg install
}
