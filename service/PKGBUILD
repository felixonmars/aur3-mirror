# Contributor: Stiletto <blasux@blasux.ru>

pkgname=service
pkgver=0.0.1
pkgrel=1
pkgdesc="RedHat-like 'service' command for services managing"
arch=('i686' 'x86_64')
url="http://blasux.ru/"
license=('GPL')
depends=(coreutils bash)
source=(service)
md5sums=('df51b373705ddbbe2f5bf33338279e52')

build() {
  install -D $startdir/service -m 0755 -o root -g root $startdir/pkg/usr/bin/service
}
