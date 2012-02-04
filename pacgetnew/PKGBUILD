# Maintainer: Lybin Lev <lybin@yandex.com>
pkgname=pacgetnew
pkgver=1.0
pkgrel=1
pkgdesc="Fast pacman! Mirror script."
arch=(i686 x86_64)
license=('FDL')
depends=('pacman' 'reflector' 'aria2')
install=pacget.install
url="http://lybin.narod.ru"
source=(http://lybin.narod.ru/linux/archlinux/pacget/${pkgname}-${pkgver}.tar.gz)
md5sums=('808d6099b232f411c82cc984c8ad7ceb')

build() {
  cd "$startdir/src/$pkgname-$pkgver"
  cp ./pacget /usr/bin/pacget
  cp ./pacget.conf /etc/pacget.conf
  cp ./pacman-update-mirrorlist /usr/bin/pacman-update-mirrorlist
}

