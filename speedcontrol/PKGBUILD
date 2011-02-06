# Contributor: mosra <mosra@centrum.cz>
pkgname=speedcontrol
pkgver=1
pkgrel=1
pkgdesc="CLI utility for adjusting optical drive speed"
arch=('i686' 'x86_64')
url="http://noto.de/speed/"
license=('GPLv2')
source=(speedcontrol.c)
md5sums=('b7ec90d2b944de17b3a10b4a4e714c2f')

build() {
  cd "$srcdir"

  gcc speedcontrol.c -o speedcontrol

  # Setuid to make sure it will work
  install -m4755 -s -D speedcontrol "$pkgdir/usr/bin/speedcontrol"

}
