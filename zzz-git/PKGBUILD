# Maintainer: Gregory 'impakt' Mitrano <blairmlh@gmail.com>

pkgname=zzz-git
pkgver=0.2.r0.g41d4349
pkgrel=1
pkgdesc="Command line utility for calculating sleep cycles"
arch=('any')
url="https://github.com/Tokette/zzz"
license=('GPL')
depends=('python')
makedepends=('git')
conflicts=('zzz')
provides=('zzz')
source=("$pkgname"::'git+https://github.com/Tokette/zzz.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 'zzz.py' "$pkgdir/usr/bin/zzz"
}
