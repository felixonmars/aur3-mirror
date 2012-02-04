# Maintainer: modywzm <modywzm at gmail dot com>
pkgname=super_pi
pkgver=2.0
pkgrel=1
pkgdesc="SuperPI is a quick reference benchmark test often used when overclocking or comparing different hardware configurations."
url="ftp://pi.super-computing.org/Linux/"
arch=('i686')
license=('GPL')
source=("ftp://pi.super-computing.org/Linux/super_pi.tar.gz")
md5sums=('92356a09cd05553be2c26f6edfff0fc4')

build() {
  cd $srcdir
  install -Dm755 pi $pkgdir/usr/bin/pi
  install -Dm755 super_pi $pkgdir/usr/bin/super_pi
  install -Dm644 Readme.txt $pkgdir/usr/share/super_pi/Readme.txt
}
