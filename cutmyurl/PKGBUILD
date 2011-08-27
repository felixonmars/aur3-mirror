# Maintainer: ubunblox <ubunblox@gmail.com>

pkgname=cutmyurl
pkgver=1.6
pkgrel=1
pkgdesc="Shortener url in command line"
arch=('any')
url="http://ubunblox.servhome.org/"
license=('GPL')
depends=('curl' 'xclip')
source=(http://ubunblox.free.fr/UbunBlox/AUR/$pkgname-$pkgver.tar.gz)
packager=('ubunblox')
md5sums=('4f1b02c71e8de1038fe0fc2e023246db')

build() {
  mkdir -p $startdir/pkg/usr/bin
  install -Dm 755 $srcdir/cutmyurl $startdir/pkg/usr/bin/
}
