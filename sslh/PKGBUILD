# Maintainer: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>

pkgname=sslh
pkgver=1.16
pkgrel=1
pkgdesc='Applicative Protocol Multiplexer'
arch=('i686' 'x86_64')
url='http://www.rutschle.net/tech/sslh.shtml'
license=('GPL2')
depends=('libconfig')
source=(http://www.rutschle.net/tech/sslh-v$pkgver.tar.gz)
md5sums=('c6e7d1cb0adb15f6efe480e36d98c560')

prepare() {
  sed -i 's/sbin/bin/g' $pkgname-v$pkgver/Makefile
}

build() {
  make -C $pkgname-v$pkgver
}

package() {
  cd $pkgname-v$pkgver
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm755 sslh-select "$pkgname"/usr/bin/sslh-select

  install -Dm644 scripts/systemd.sslh.service \
    "$pkgdir"/usr/lib/systemd/system/sshl.service
  install -Dm644 scripts/etc.default.sslh "$pkgdir"/etc/conf.d/sslh
}
