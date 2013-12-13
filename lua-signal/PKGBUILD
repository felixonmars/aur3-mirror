# Maintainer: RunningDroid <runningdroid AT zoho.com>
# Contributor: Cameron Banta <cbanta@gmail.com>
pkgname=lua-signal
pkgver=1.300
pkgrel=1
pkgdesc="Signal library for Lua"
license=('MIT')
arch=('i686' 'x86_64')
url="https://github.com/LuaDist/lua-signal"
# I'm pointing people to the lua51-signal page because the API is the same
depends=('lua')
source=('https://gist.github.com/RunningDroid/7922848/raw/f5d775490e66b4cad253fd4b296babfdc89e5f6c/signal.c'
        'MIT')
md5sums=('a7762aa606e011a347d7c1ce910b4737'
         '965fc04e2d43b9dd6d4e39cd3a7f409b')

build() {
    gcc -fPIC -shared signal.c
}

package() {
    install -D -m644 a.out "$pkgdir"/usr/lib/lua/5.2/signal.so
    install -D -m644 MIT "$pkgdir"/usr/share/licenses/lua-signal/LICENSE
}
