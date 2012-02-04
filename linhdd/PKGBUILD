# Contributor: Shiba Ikumi <shibotto@gmail.com>
pkgname=linhdd
pkgver=0.4
pkgrel=1
pkgdesc="View properties, partition, format or test speed of IDE, SATA drives and USB sticks under Linux."
arch=('i686')
url="http://www.pcbypaul.com/software/linHDD.html"
license=('GPL')
depends=('gtk2>=2.6' 'python>=2.4' 'pygtk>=2.6' 'pango' 'hdparm')
install=$pkgname.install
source=(http://www.pcbypaul.com/software/dl/linHDD-$pkgver.tar.bz2 linhdd.png linhdd.desktop)
md5sums=('381d0d1ec5e72bac3f4ab097b9625156' 'e6c3c9c0cab50a775b0e584e10851060' '89640f34cc027a85530c5a7f08e45431')

build() {
  mkdir -p $startdir/pkg/usr/{bin,share/pixmaps,share/applications}

  cp $startdir/src/linHDD-$pkgver/{abs_fdisk,linHDD.py} $startdir/pkg/usr/bin
  cp $startdir/src/$pkgname.png $startdir/pkg/usr/share/pixmaps
  cp $startdir/src/$pkgname.desktop $startdir/pkg/usr/share/applications
}
