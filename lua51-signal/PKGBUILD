# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributor: Cameron Banta <cbanta@gmail.com>
pkgname=lua51-signal
pkgver=1.000
pkgrel=1
pkgdesc="Signal library for Lua 5.1"
license=('MIT')
arch=('i686' 'x86_64')
url="https://github.com/LuaDist/lua-signal"
depends=('lua51')
source=('https://github.com/LuaDist/lua-signal/archive/1.000.tar.gz'
        'MIT')
md5sums=('9e1b44719907055342e3740271061f26'
         '965fc04e2d43b9dd6d4e39cd3a7f409b')

build() {
    cd lua-signal-$pkgver

    gcc `pkg-config --libs --cflags lua5.1` -shared -fPIC -o signal.so lsignal.c
}

package() {
    cd lua-signal-$pkgver

	install -D -m644 signal.so "$pkgdir"/usr/lib/lua/5.1/signal.so
    install -D -m644 "$srcdir"/MIT "$pkgdir"/usr/share/licenses/lua51-signal/LICENSE
}
