# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=copas
pkgver=1.1.6
pkgrel=2
pkgdesc='Lua dispatcher based on coroutines'
arch=('any')
url='http://www.keplerproject.org/copas/'
license=('MIT')
depends=('luasocket' 'coxpcall')
source=("https://github.com/downloads/keplerproject/$pkgname/$pkgname-$pkgver.tar.gz"
        'LICENSE.txt')
md5sums=('104b4325a6187eeb4b139181b6477558'
         '65fda3841b3c98680c61ad836b030a9c')

build() {
  install -Dm0444 $srcdir/$pkgname-$pkgver/src/copas/copas.lua \
   $pkgdir/usr/share/lua/5.1/copas.lua
  install -Dm0644 $srcdir/LICENSE.txt \
   $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
