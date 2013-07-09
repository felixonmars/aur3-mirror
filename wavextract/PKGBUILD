# Maintainer: Edoardo Maria Elidoro <edoardo.elidoro@gmail.com>
# Contributor: Michal Krenek <mikos@sg1.cz>

pkgname=wavextract
pkgver=1.0.0
pkgrel=1
pkgdesc="Program for extracting embedded audio data from JPEG images"
url="http://developer.berlios.de/projects/wavextract"
arch=(any)
license=(GPL)
depends=('python2')
source=(http://download.berlios.de/wavextract/$pkgname-$pkgver.tar.gz)
md5sums=('d0987179afd5ec70a0c6d2f9bf5d4289')

package() {
  cd $startdir/src/$pkgname
  mkdir -p $startdir/pkg/usr/bin
  install -m 755 $pkgname $startdir/pkg/usr/bin/$pkgname
}
