pkgname=wqy-unibit
pkgver=1.1.0
pkgrel=1
pkgdesc="A dual-width (16x16,16x8) bitmap font."
arch=('any')
license=('GPL2')
install=wqy-unibit.install
url="http://wenq.org"
depends=('fontconfig' 'xorg-bdftopcf')
source=("http://downloads.sourceforge.net/project/wqy/$pkgname/$pkgver/$pkgname-bdf-$pkgver-$pkgrel.tar.gz")  
md5sums=('751dacd1326cd49b44486b45c592cfa6')
build() {
  cd "$srcdir/$pkgname"
  make all
}

package() {
  install -Dm644 "$srcdir/$pkgname/wqy-unibit.pcf" "$pkgdir/usr/share/fonts/wenquanyi/$pkgname/wqy-unibit.pcf"
}
