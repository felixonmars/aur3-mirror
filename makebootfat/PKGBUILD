#Maintainer: Sebastien Luttringer <seblu+arch@seblu.net>
#Contributor: Michal Bozon <michal.bozon__at__gmail.com>
pkgname=makebootfat
pkgver=1.4
pkgrel=4
pkgdesc='Utility to create bootable FAT filesystems'
arch=('i686' 'x86_64')
url='http://advancemame.sourceforge.net/doc-makebootfat.html'
license=('GPL')
source=("http://prdownloads.sourceforge.net/advancemame/$pkgname-$pkgver.tar.gz")
md5sums=('8ae9144e2bec8b8498361a25fdf76741')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 ft=sh et:
