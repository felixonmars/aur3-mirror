# Maintainer: Hassan Zamani <hsn.zamani@gmail.com>
pkgname=echoprint-codegen
pkgver=4.12
pkgrel=1
pkgdesc="Music fingerprint and resolving framework powered by The Echo Nest"
arch=(i686 x86_64)
url="http://echoprint.me/"
license=('MIT')
depends=('ffmpeg' 'taglib' 'zlib')
makedepends=('boost')
provides=(echoprint-codegen)
conflicts=(echoprint-codegen-git)
source=('https://github.com/echonest/echoprint-codegen/archive/release-4.12.tar.gz')
md5sums=('8179c462260d1c9733fb56eb829c03fb')

build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  make -C src
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"
  install -D $pkgname $pkgdir/usr/bin/$pkgname
}

