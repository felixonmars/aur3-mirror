# maintainer: perlawk

pkgname=ljclang
pkgver=1.0.1
pkgrel=1
pkgdesc="LJClang: A JuaJIT-based interface to libclang."
arch=('i686' 'x86_64')
url="https://github.com/helixhorned/ljclang"
license=('MIT')
depends=('luajit' 'clang')
source=("https://github.com/helixhorned/ljclang/archive/master.zip")

build() {
    cd ${pkgname}-master
		make
}

package() {
    cd ${pkgname}-master
		loc="$pkgdir"/usr/lib/lua/5.
		mkdir -p "$loc"1 "$loc"2
		cp ljclang.lua libljclang_support.so "$loc"1
		cp ljclang.lua libljclang_support.so "$loc"2
}
md5sums=('SKIP')
