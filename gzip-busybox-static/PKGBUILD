# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=gzip-busybox-static
pkgver=1.22.1
pkgrel=1
pkgdesc="GNU compression utility"
arch=('any')
url="http://www.busybox.net"
license=('GPLv2')
depends=('busybox-static>=1.22.1-2')
provides=('gzip')
conflicts=('gzip')
options=(strip !libtool staticlibs !upx !debug)


package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s ./busybox gzip
}

