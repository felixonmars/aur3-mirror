# Maintainer: Pierre Chapuis <catwell at archlinux dot us>

pkgname=concurrentlua
pkgver=1.0.5
pkgrel=1
pkgdesc='Erlang-style concurrency for Lua'
arch=('i686' 'x86_64')
url='http://concurrentlua.luaforge.net/index.html'
license=('MIT')
depends=('copas')
source=("http://luaforge.net/frs/download.php/4477/$pkgname-$pkgver.tar.bz2")
md5sums=('3c22c66e0e41f569661918ae6cbfb132')

build() {
  cd $srcdir/$pkgname-$pkgver
  make PREFIX=/usr all
  make PREFIX="$pkgdir/usr" install
  install -Dm0644 LICENSE \
   $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt
}
