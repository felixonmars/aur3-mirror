# $Id: PKGBUILD 68685 2012-03-31 16:54:07Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=pocketmine-mp
pkgver=1.3.12
pkgrel=1
pkgdesc='Server software for Minecraft: Pocket Edition'
arch=('x86_64' 'i686')
url='https://github.com/PocketMine/PocketMine-MP'
license=('GPL3')
depends=('php-sqlite' 'php-yaml' 'pecl-pthreads') #'pecl-pthreads>=0.1.0')
makedepends=('shedskin')
source=("https://github.com/PocketMine/PocketMine-MP/archive/Alpha_$pkgver.zip")
sha256sums=('b53d915885467a21c4485acaaa6e291044628a18e3b0b4bfca76a7899c0657b0')

build() {
  cd "PocketMine-MP-Alpha_$pkgver"
  export PATH="/usr/bin/php_zts:$PATH"
  ./start.sh
}

package() {
  cd "PocketMine-MP-Alpha_$pkgver"
}

# vim:set ts=2 sw=2 et:
