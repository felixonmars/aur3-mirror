# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Ivan Sichmann Freitas <ivansichfreitas@gmail.com>

pkgname=lnotify
pkgver=0.2_6
_pkgver=0.2-6
pkgrel=2
pkgdesc="Simple bind from libnotify to Lua"
arch=('i686' 'x86_64')
url="http://w3.impa.br/~gabrield/code/lua_stuff/lnotify/"
license=('MIT')
depends=(lua libnotify)
#install=
source=(http://w3.impa.br/~gabrield/code/lua_stuff/lnotify/$pkgname-$_pkgver.tar.gz
        lnotify.patch Makefile.patch)
md5sums=('62964328f4b72843e34fc5bdbce5ff12'
         '9ecfdf9f53db0a074a3576f71fe7a0e0'
         '4412dd73b1215b8f3d95291f9d6b84f1')

build() {
  cd "$srcdir/$pkgname-$_pkgver"
  patch < $startdir/lnotify.patch
  patch < $startdir/Makefile.patch
  make
  make notify.so
}

package() {
  cd "$srcdir/$pkgname-$_pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
