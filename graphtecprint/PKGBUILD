# Contributor: tri1976 <trile7@gmail.com>

pkgname=graphtecprint
pkgver=1.0.1
pkgrel=1
pkgdesc="driver/cutting application for the desktop plotter/cutter Graphtec CC200-20 or any of the OEM models based on it, such as the QuicKutz Silhouettei or the Xyron Wishblade."
url="http://vidar.gimp.org/graphtecprint"
license=""
arch=('i686')
depends=('pygtk' 'pstoedit' 'ghostscript' 'libglade' 'pycairo')
makedepends=()
options=()
source=(http://vidar.gimp.org/wp-content/uploads/2008/07/"$pkgname"-"$pkgver".tar.gz)
md5sums=('5fc92da0483f9a9e3061e686c985c8b7')

build() {
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/"$pkgname"
  cd $srcdir/$pkgname-$pkgver
  cp graphtecprint $pkgdir/usr/bin ||return 1
  cp *.png *.glade $pkgdir/usr/share/"$pkgname" ||return 1
  }
