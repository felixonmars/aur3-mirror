# Maintainer: archtux <antonio.arias99999@gmail.com>

pkgname=pysum
pkgver=0.5
pkgrel=1
pkgdesc="Application for calculating and verifying checksums"
arch=('i686' 'x86_64')
url="http://pysum.berlios.de/en/"
license=('GPL2')
depends=('pygtk')
source=(http://download.berlios.de/pysum/pysum-$pkgver.tar.gz)

md5sums=('24d9416473c6d8f8f850ff62378d2b7b')

build() {
  
   cd $srcdir/pysum-$pkgver

   mkdir -p $pkgdir/usr/share/pysum
   cp -R * $pkgdir/usr/share/pysum/
   mv $pkgdir/usr/share/pysum/src/pysum.glade $pkgdir/usr/share/pysum

   # Desktop icon
   install -Dm644 ./img/pysum.png $pkgdir/usr/share/pixmaps/pysum.png
   install -Dm644 $startdir/pysum.desktop $pkgdir/usr/share/applications/pysum.desktop
}
