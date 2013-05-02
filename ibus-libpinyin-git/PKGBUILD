# Maintainer:  Yangtse Su<yangtsesu@gmail.com>
# Contributor:  Jekyll Wu<adaptee [at] gmail [dot] com>
# Contributor: riverscn<riverscn at gmail.com>
# Contributor: rainy<rainylau at gmail.com>
# Contributor: Lee.MaRS<leemars at gmail.com>

pkgname=ibus-libpinyin-git
_gitname=ibus-libpinyin
pkgver=1128.78bb55a
pkgrel=1
pkgdesc="Intelligent Pinyin engine based on libpinyin for IBus"
arch=('i686' 'x86_64')
license=('LGPL')
url="https://github.com/libpinyin"
depends=('ibus>=1.4' 'libsigc++2.0' 'python2' 'libpinyin' 'lua51')
makedepends=('git' 'intltool' 'gnome-common')
provides=('ibus-libpinyin')
replace=('ibus-pinyin-libpinyin-git')
conflicts=('ibus-libpinyin' 'ibus-pinyin-libpinyin-git')
source=('git+https://github.com/libpinyin/ibus-libpinyin.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname

  # python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
    sed -i 's_^#!.*/usr/bin/env.*python_#!/usr/bin/env python2_' $file
  done

  for file in setup/ibus-setup-libpinyin.in; do
    sed -i 's_exec python_exec python2_' $file
  done
  
  LUA_CFLAGS="-I/usr/include/lua5.1" LUA_LIBS="-llua5.1 -lm" ./autogen.sh --prefix=/usr --libexecdir=/usr/lib/$pkgname
  make
}

package() {
  cd $_gitname
  make NO_INDEX=true DESTDIR=${pkgdir} install
}
