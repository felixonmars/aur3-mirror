# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=agena
pkgver=1.0.3
pkgrel=1
pkgdesc="A procedural programming language based on Lua"
arch=('i686' 'x86_64')
url="http://agena.sourceforge.net/"
license=('LGPL')
depends=('readline' 'ncurses')
optdeps=('gnumeric') # for the .xls
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz"
        "arch.patch")
md5sums=('b228258484cae0a2c7f0a40a1a8df3f7'
         '34b9190e0ff782792349be5dcb6a4b25')

build() {
  cd "$srcdir"

  msg "Patching..."
  patch -p0 < ../arch.patch || return 1

  msg "Compiling..."
  make -C src config || return 1
  make -C src linux || return 1

  echo "export AGENAPATH=/usr/lib/agena" >> agena.sh
  install -Dm755 agena.sh "$pkgdir/etc/profile.d/agena.sh"

  msg "Packaging include files..."
  mkdir -p "$pkgdir/usr/include/"
  cp include/*.h "$pkgdir/usr/include"

  msg "Packaging executables..."
  install -Dm755 src/agena "$pkgdir/usr/bin/agena" || return 1
  install -Dm644 src/libagena.so "$pkgdir/usr/lib/libagena.so" || return 1

  msg "Packaging library files..."
  mkdir -p "$pkgdir/usr/lib/$pkgname/"
  cp lib/* "$pkgdir/usr/lib/$pkgname/"

  msg "Packaging documentation..."
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  cp doc/agena* "$pkgdir/usr/share/doc/$pkgname/"

  msg "Packaging icons..."
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp share/*.png "$pkgdir/usr/share/pixmaps/"
  cp share/*.gif "$pkgdir/usr/share/pixmaps/"

  msg "Packaging license..."
  install -Dm644 src/licence \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE" || return 1

}
# vim:set ts=2 sw=2 et:
