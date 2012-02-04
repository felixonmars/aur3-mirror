# Contributor: Kun Wang <ifreedom.dot.cn.at.gmail.dot.com>

pkgname=lua-marshal
pkgver=1
pkgrel=1
pkgdesc="Fast table serialization for Lua"
arch=('i686' 'x86_64')
# groups=('')
url="https://github.com/richardhundt/lua-marshal"
license=('MIT')
depends=('lua')
makedepends=('make' 'gcc')
# conflicts=('')
# provides=('')
# replaces=('')
# options=('!libtool')
source=("lua-marshal.tar.gz")
md5sums=('a0e0e7852dccd54d32cd6bbe6adb6be9')

_name=lua-marshal

build() {
  cd "$srcdir/"

  rm -rf "$srcdir/$_name-build"
  cp -r "$srcdir/$_name" "$srcdir/$_name-build"
  cd "$srcdir/$_name-build"

  make so || return 1
}

package(){
  cd "$srcdir/$_name-build"

  mkdir -p $pkgdir/usr/lib/lua/5.1/
  install -Dm644 $srcdir/$_name-build/marshal.so \
	  $pkgdir/usr/lib/lua/5.1/

  rm -rf "$srcdir/$_name-build"
}
