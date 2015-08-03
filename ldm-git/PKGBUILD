## ldm-git PKGBUILD
# Maintainer: The Lemon Man
# Contributor: Robin Hahling

pkgname=ldm-git
pkgver=0.6.1.r11.g80f3ea8
pkgrel=1
pkgdesc="A lightweight device mounter"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/LemonBoy/ldm"
license=('MIT')
depends=('udev' 'glib2')
makedepends=('git')
provides=('ldm')
conflicts=('ldm')
install=$pkgname.install
source=('git://github.com/LemonBoy/ldm.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir"/ldm
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
}

prepare() {
	cd "$srcdir"/ldm
}

build() {
  cd "$srcdir"/ldm
  make
}

package() {
  cd "$srcdir"/ldm
  make PREFIX=/usr DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
