# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: garion < garion @ mailoo.org >
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: mutlu_inek <mutlu_inek@yahoo.de>

pkgname=iscan-data
pkgver=1.36.0
pkgrel=1
pkgdesc="Image Scan! for Linux data files"
arch=('any')
url="http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX"
license=('GPL2')
depends=('libxslt' 'udev')
conflicts=(${pkgname}-legacy)
install=${pkgname}.install
source=("https://download3.ebz.epson.net/dsc/f/03/00/03/61/59/646738a219f7354bf3268897385f6ce48c0776bf/iscan-data_1.36.0-1.tar.gz")
md5sums=('787c0734f7f35335c2f74ae21e3b4a11')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install

  #Bug reporting by tomxtobin: the make-policy-file call in the post_install hook seems to be failing.
  #echo 'ATTRS{idVendor}=="04b8", ATTRS{idProduct}=="0101", MODE="0664", GROUP="scanner",ENV{libsane_matched}="yes"' > iscan.rules
  #install -m644 iscan.rules $pkgdir/usr/share/iscan-data/
}




