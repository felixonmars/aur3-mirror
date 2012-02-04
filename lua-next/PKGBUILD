# Contributor: Anders Bergh <anders1@gmail.com>
pkgname=lua-next
pkgver=5.2.0_work2
pkgrel=1
pkgdesc="The next version of Lua under development"
arch=(i686 x86_64)
url="http://www.lua.org/"
license=('MIT')
depends=('readline' 'ncurses')
provides=("lua=$pkgver")
conflicts=('lua')
source=(http://www.lua.org/work/lua-5.2.0-work2.tar.gz)
md5sums=('b246c52fa669db8bb16d6b34c2b35e2d')

build() {
  cd "$srcdir/lua-5.2.0-work2"
  make linux
  make INSTALL_TOP="$pkgdir/usr" install
}
