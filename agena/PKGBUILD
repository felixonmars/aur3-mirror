# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=agena
pkgver=2.2.6
pkgrel=1
pkgdesc='Procedural programming language based on Lua'
arch=('x86_64' 'i686')
url='http://agena.sourceforge.net/'
license=('LGPL')
depends=('readline')
optdepends=("gnumeric: for reading /usr/share/doc/$pkgname/$pkgname.xls")
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.gz"
       'arch.patch'
       'run.sh')
sha256sums=('SKIP'
            '1d9a22af9ff167ad28bc7bc30f5b3368391c0123831282195da48542a6c1412d'
            'b7dc41cf7b79d4b5ba26117de08adaa63d3d417b3119d1ed5b2d0ca12c8e2485')

prepare() {
  cd "$pkgname-$pkgver-src"

  # Script for /etc/profile.d/
  echo "export AGENAPATH=/usr/lib/agena" > $pkgname.sh
}

build() {
  cd "$pkgname-$pkgver-src"

  make -C src config
  make CFLAGS+="-fPIC" -C src linux
}

package() {
  cd "$pkgname-$pkgver-src"

  # Scripts
  install -Dm755 $pkgname.sh "$pkgdir/etc/profile.d/$pkgname.sh"
  install -Dm755 $srcdir/run.sh "$pkgdir/usr/bin/$pkgname"

  # Include files
  mkdir -p "$pkgdir/usr/include/"
  cp include/*.h "$pkgdir/usr/include"

  # Executables
  install -Dm755 "src/$pkgname" "$pkgdir/usr/bin/$pkgname.elf"

  # Libraries
  install -Dm644 "src/lib$pkgname.so" "$pkgdir/usr/lib/lib$pkgname.so"
  mkdir -p "$pkgdir/usr/lib/$pkgname/"
  cp lib/* "$pkgdir/usr/lib/$pkgname/"

  # Documentation
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  cp doc/$pkgname* "$pkgdir/usr/share/doc/$pkgname/"

  # Icons
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  cp share/*.png "$pkgdir/usr/share/pixmaps/"
  cp share/*.gif "$pkgdir/usr/share/pixmaps/"

  # License
  install -Dm644 src/licence \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
