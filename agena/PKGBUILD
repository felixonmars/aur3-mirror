# Contributor: Alexander Rødseth <rodseth@gmail.com>
pkgname=agena
pkgver=1.4.0
pkgrel=1
pkgdesc="A procedural programming language based on Lua"
arch=('x86_64' 'i686')
url="http://agena.sourceforge.net/"
license=('LGPL')
depends=('readline')
optdeps=("gnumeric: for reading /usr/share/doc/$pkgname/$pkgname.xls")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz"
        "arch.patch")
md5sums=('ac82cdbfbd116e679b160c2344063b61'
         'fa431cc8c7171ace90809cd2c1dbfa3d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Patching..."
  patch -p1 < ../arch.patch

  msg2 "Compiling..."
  make -C src config
  make CFLAGS+="-fPIC" -C src linux

  msg2 "Creating wrapperscript..."
  echo '#!/bin/sh' > run
  echo 'if [ ! -f $AGENAPATH/library.agn ]; then' >> run
  echo '  AGENAPATH=/usr/lib/agena agena.elf $*' >> run
  echo 'else' >> run
  echo '  agena.elf $*' >> run
  echo 'fi' >> run

  msg2 "Creating script for /etc/profile.d..."
  echo "export AGENAPATH=/usr/lib/agena" > $pkgname.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  msg2 "Packaging scripts..."
  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"
  install -Dm755 run "$pkgdir/usr/bin/$pkgname"

  msg2 "Packaging include files..."
  mkdir -p "$pkgdir/usr/include/"
  cp include/*.h "$pkgdir/usr/include"

  msg2 "Packaging executables..."
  install -Dm755 src/$pkgname "$pkgdir/usr/bin/$pkgname.elf"
  install -Dm644 src/lib$pkgname.so "$pkgdir/usr/lib/lib$pkgname.so"

  msg2 "Packaging library files..."
  mkdir -p "$pkgdir/usr/lib/$pkgname/"
  cp lib/* "$pkgdir/usr/lib/$pkgname/"

  msg2 "Packaging documentation..."
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  cp doc/$pkgname* "$pkgdir/usr/share/doc/$pkgname/"

  msg2 "Packaging icons..."
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp share/*.png "$pkgdir/usr/share/pixmaps/"
  cp share/*.gif "$pkgdir/usr/share/pixmaps/"

  msg2 "Packaging license..."
  install -Dm644 src/licence \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
