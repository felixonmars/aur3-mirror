# Maintainer: Hong Shick Pak  hongshick.pak@gmail.com

pkgname=simpfand
pkgver=3.0
pkgrel=1
pkgdesc="A simple fan control daemon for ThinkPads"
arch=('i686' 'x86_64')
url="http://github.com/hspasta/simpfand"
license=('GPLv3')
depends=()
conflicts=('simpfand-git')
makedepends=('git')
backup=('share/doc/simpfand/simpfand')
source=("https://github.com/downloads/hspasta/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('25034053e1de6a5cb19ff948cfbfdd59')
install=simpfand.install

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  install -D -m644 "$srcdir/simpfand-$pkgver/simpfand.systemd" "$pkgdir/usr/lib/systemd/system/simpfand.service"
  
  make -C "$pkgname-$pkgver" PREFIX=/usr DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
