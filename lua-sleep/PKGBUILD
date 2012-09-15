# Maintainer: Cameron Banta <cbanta@gmail.com>
pkgname=lua-sleep
pkgver=0.1
pkgrel=1
pkgdesc="Sleep functions for Lua"
license=('public-domain')
arch=('i686' 'x86_64')
url="http://projects.plentyfact.org/projects/lua-sleep"
depends=('lua')
makedepends=('lua')
source=("http://projects.plentyfact.org/attachments/download/21/lua-sleep_${pkgver}.tar.gz")

_builddir=$srcdir/lua-sleep_$pkgver
build() {
	make -C "$_builddir"
}

package() {
	local dir=$pkgdir/usr/lib/lua/5.1
	install -d "$dir"
	install "$_builddir/lsleep.so" "$dir"
}
md5sums=('aeb91a0abeb483868e27c4f5add59805')
