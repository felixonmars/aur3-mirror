# Maintainer: Leonardo De Luca <leo at kde.org.ar>
# Contributor: Ali Gündüz <gndz.ali@gmail.com>
pkgname=oggjam
pkgver=0.9.3
pkgrel=1
pkgdesc="A script to directly download ogg/vorbis files from Jamendo.com"
arch=(i686 x86_64)
url="http://leorockway.com.ar/oggjam"
license=('GPL')
depends=('python')
source=('http://leorockway.com.ar/oggjam-0.9.3')
md5sums=('e3457b4f1263ac18ffdad61d0f7da7ed')

build() {
  cd "$srcdir"

  install -Dm755 ${pkgname}-${pkgver} $pkgdir/usr/bin/$pkgname

}
