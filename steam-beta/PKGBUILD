# Maintainer : Daniel Kirchner <ekpyron at lavabit dot com>

pkgname=steam-beta
pkgver=1
pkgrel=1
pkgdesc="Steam for Linux beta."
arch=('i686' 'x86_64')
url="http://store.steampowered.com/"
source=('http://media.steampowered.com/client/installer/steam.deb')
md5sums=('7a076d134ba360337dd6611ac059de87')
license=('custom:ZLIB')
depends=('')
makedepends=('deb2targz')
conflicts=('')


build() {
  cd "$srcdir"
  
  deb2targz steam.deb
  tar xvzf steam.tar.gz -C "$pkgdir"
}