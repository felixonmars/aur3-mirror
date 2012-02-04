# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=jackctl
pkgver=20110317
pkgrel=1
pkgdesc="A simple jack control manager written in pure python."
arch=('any')
url="http://www.akjmusic.com/software/"
license=('GPL')
depends=('python2' 'alsa-utils' 'jack')
source=("http://www.akjmusic.com/software/$pkgname$pkgver.py")
md5sums=('515442504e061997eef60b4246620773')

build() {
  cd "$srcdir"

  # Python2 Fix
  sed -i "s|\(bin/\)\(python\)|\1env \22|" "$pkgname$pkgver.py"
}

package() {
  cd "$srcdir"

  install -Dm755 "$pkgname$pkgver.py" "$pkgdir/usr/bin/$pkgname"
}