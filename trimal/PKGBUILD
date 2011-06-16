# Maintainer: yescalona <yescalona_at_ug_dot_uchile_dot_cl>

pkgname=trimal
pkgver=1.2rev59
pkgrel=1
pkgdesc="A tool for automated alignment trimming"
arch=('i686')
url="http://trimal.cgenomics.org/"
license=('GPL3')
depends=('gcc-libs')
source=($url/_media/$pkgname.v$pkgver.tar.gz)
noextract=()
md5sums=('ff5d845da677fe0060c0d9c35c9cc673')

build() {
  cd "$srcdir/trimAl/source"
  make
}

package() {
  install -d $pkgdir/usr/bin
  cd $srcdir/trimAl/source/
  install -Dm755 trimal readal $pkgdir/usr/bin
}
