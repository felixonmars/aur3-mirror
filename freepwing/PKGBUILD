# Maintainer: Mark Quinn <mmq.arch@dekinai.com>
pkgname=freepwing
pkgver=1.5
pkgrel=1
pkgdesc='A free JIS X 4081 (subset of EPWING V1) formatter'
arch=('any')
# Link seems dead for a long time
url="http://www.sra.co.jp/people/m-kasahr/freepwing/"
license=('GPL')
depends=('perl')
makedepends=()
source=('http://http.debian.net/debian/pool/main/f/freepwing/freepwing_1.5.orig.tar.gz')
md5sums=('50b74620313d540357aed1bfe8068ab2')


build() {
  cd "$srcdir/$pkgname-$pkgver.orig"

  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver.orig"

  make DESTDIR="$pkgdir/" install
}
