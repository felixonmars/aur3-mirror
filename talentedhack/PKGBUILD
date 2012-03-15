# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=talentedhack
pkgver=1.85
pkgrel=1
pkgdesc="An LV2 port of Tom Baran's Autotalent, with added features and improved performance."
arch=('i686' 'x86_64')
url="http://code.google.com/p/talentledhack/"
license=('GPL')
depends=('lv2core' 'fftw')
source=("http://talentledhack.googlecode.com/files/${pkgname}${pkgver}_source.tar.gz")
md5sums=('f581d5a87f130431ab4b3d194fdad194')

build() {
  cd "$srcdir/$pkgname.lv2"
  
  make
}

package() {
  cd "$srcdir/$pkgname.lv2"

  install -d $pkgdir/usr/lib/lv2/$pkgname.lv2
  install -Dm755 *.{so,ttl} $pkgdir/usr/lib/lv2/$pkgname.lv2
}

