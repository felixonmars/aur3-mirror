# Maintainer: Marcus Ilgner <mail@marcusilgner.com>

pkgname=prax-git
arch=('i686' 'x86_64')
pkgrel=1
pkgdesc="Custom hostname resolver to facilitate Ruby On Rails development"
url="https://github.com/ysbaddaden/prax/tree/master"
license=('unknown')
makedepends=('git')
source=("prax-system.service"
        "prax-user.service"
        "$pkgname"::'git://github.com/milgner/prax.git#branch=feature/arch_package')
sha256sums=('ce4f646c0dbb7035abc3914c6993a561f8881545a73a9f6b77b37a992c32d59a'
            'eb9a2e5ed6193622a5972b696b5f8cb60ae01195c69f339ce8a73ec1aa651d51'
            'SKIP')
install="$pkgname.install"

pkgver=0.1.0

build() {
  cd "$srcdir/$pkgname/ext"
  make
  make clean
  cd "$srcdir/$pkgname/install"
  chmod +x initd
}

package() {
  mkdir -p "$pkgdir/opt/prax"
  cd "$srcdir/$pkgname"
  cp -r * "$pkgdir/opt/prax"
  mkdir -p "$pkgdir/usr/lib/systemd/user"
  cp "$srcdir/prax-user.service" "$pkgdir/usr/lib/systemd/user"
  mkdir -p "$pkgdir/usr/lib/systemd/system"
  cp "$srcdir/prax-system.service" "$pkgdir/usr/lib/systemd/system"
}
