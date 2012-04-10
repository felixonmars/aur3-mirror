# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=clijack
pkgver=20120223
pkgrel=1
pkgdesc="A simple jack control manager written in pure python."
arch=('any')
url="http://www.akjmusic.com/software/"
license=('GPL')
depends=('python2' 'alsa-utils' 'jack')
replaces=('jackctl')
source=("http://www.akjmusic.com/software/$pkgname-$pkgver.py")
md5sums=('6d3d7d331b5312bfe0b890ff4fe0c3c4')

build() {
  return 0
}

package() {
  install -Dm755 "$srcdir/$pkgname-$pkgver.py" \
    "$pkgdir/usr/bin/$pkgname"
}