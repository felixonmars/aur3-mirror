# Maintainer: Denis Kulakov <ked9@yandex.ru>

pkgname=tar-busybox-static
pkgver=1.22.1
pkgrel=1
pkgdesc="Utility used to store, backup, and transport files"
arch=('any')
url="http://www.busybox.net"
license=('GPLv2')
depends=('busybox-static>=1.22.1-2')
provides=('tar')
conflicts=(tar)
options=(strip !libtool staticlibs !upx !debug)


package() {
  mkdir "$pkgdir/usr"
  mkdir "$pkgdir/usr/bin"
  cd "$pkgdir/usr/bin"
  ln -s ./busybox tar
}

