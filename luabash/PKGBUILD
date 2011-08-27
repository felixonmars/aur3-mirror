# Contributor: Kun Wang <ifreedom.dot.cn.at.gmail.dot.com>

pkgname=luabash
pkgver=1.0
pkgrel=1
pkgdesc="a bridge between GNU bash and the Lua scripting language"
arch=('i686' 'x86_64')
# groups=('')
url="http://freshmeat.net/projects/luabash"
license=('GPL')
depends=('bash' 'lua')
makedepends=('make')
# conflicts=('')
# provides=('')
# replaces=('')
options=('!libtool')
source=("luabash.tar.gz")
md5sums=('39f3d56e498c7091577b3e999bb0ace2')

_name=$pkgname

build() {
  cd "$srcdir/"

  rm -rf "$srcdir/$_name-build"
  cp -r "$srcdir/$_name" "$srcdir/$_name-build"
  cd "$srcdir/$_name-build"

  gcc -shared -fPIC -Wall -o luabash.so luabash.c -llua -lm -Wall -ldl
}

package(){
  cd "$srcdir/$_name-build"

  mkdir -p $pkgdir/usr/share/$_name
  install -Dm644 $srcdir/$_name-build/luabash.so \
  	$pkgdir/usr/share/$_name/

# install examples files
  mkdir -p $pkgdir/usr/share/doc/$_name/example
  install -Dm755 $srcdir/$_name-build/example/* \
  	$pkgdir/usr/share/doc/$_name/example

  rm -rf "$srcdir/$_name-build"
}
