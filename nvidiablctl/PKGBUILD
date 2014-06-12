# Maintainer: Hasan Gormus aka hsngrms <hsngrms at yandex dot com>
pkgname=nvidiablctl
pkgver=0.2
pkgrel=2
pkgdesc="Application to adjust display backlight with nvidiabl module."
arch=('x86_64' 'i686')
url="https://github.com/guillaumezin/nvidiabl"
license=('GPL')
source=(https://raw.github.com/guillaumezin/nvidiabl/master/scripts/usr/local/sbin/nvidiablctl)
md5sums=('a154a3c408d8f2d65bc35f04ad8ba860')

build() {
  chmod +x nvidiablctl
}

package() {
  install -D -m755 nvidiablctl "$pkgdir/usr/bin/nvidiablctl"
}
