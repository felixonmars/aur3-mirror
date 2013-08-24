# Maintainer: Christof "chdorner" Dorner <https://github.com/chdorner>
pkgname=ec2-ssh-config
pkgver=0.1.0
pkgrel=2
pkgdesc="A little utility for syncing down EC2 instances to your local SSH config."
arch=('x86_64' 'i686')
url="http://github.com/chdorner/$pkgname/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/chdorner/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('af9bcebd1e3bf6eb12e950763b0afdb3')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  go build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
