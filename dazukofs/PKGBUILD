# Maintainer: TDY <tdy@gmx.com>

pkgname=dazukofs
pkgver=3.1.4
pkgrel=1
pkgdesc="A stackable filesystem providing online file access control for userspace applications"
arch=('i686' 'x86_64')
url="http://www.dazuko.org/"
license=('GPL')
depends=('kernel26>=2.6.31')
options=('!makeflags')
install=$pkgname.install
source=(http://dazuko.dnsalias.org/files/$pkgname-$pkgver.tar.gz)
md5sums=('8a3e01a93a37867a021b1b8524f63461')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  install -Dm644 "$srcdir/$pkgname-$pkgver/$pkgname.ko" \
    "$pkgdir/lib/modules/$(uname -r)/kernel/fs/$pkgname/$pkgname.ko"
  sed -i "/^KERN/ s/=.*/=$(uname -r)/" "$startdir/$install"
}
