# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=hardlink
pkgver=0.1.2
pkgrel=1
pkgdesc='Replace file copies using hardlinks'
arch=('any')
url='http://jak-linux.org/projects/hardlink/'
license=('custom: MIT')
depends=('python2')
source=("http://jak-linux.org/projects/hardlink/hardlink_$pkgver.tar.gz")
md5sums=('9c5a71b46a86cd292f922071c90452e1')

build() {
  cd $pkgname-$pkgver
  # arch python default is python3
  find . -type f -exec \
    sed -i '1s,^#! \?/usr/bin/\(env \|\)python$,#!/usr/bin/python2,' {} \;
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  # install icense
  install -Dm 644 debian/copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 ft=sh et:
