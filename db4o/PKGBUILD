# $Id$
# Maintainer: Balló György <ballogyor+arch at gmail dot com>

pkgname=db4o
pkgver=8.0
pkgrel=1
pkgdesc="Object-oriented database that store and retrieve any application object with only one line of code"
arch=('any')
url="http://db4o.com/"
license=('GPL')
depends=('mono')
source=(http://www.db4o.com/downloads/$pkgname-$pkgver-net40.zip
        $pkgname.pc)
md5sums=('ebdcaeb6bcb2699bffc88cf0698ce4fd'
         '674e4a9a63e802e94e4e54d8d5329816')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i "s/@VERSION@/$pkgver/" $srcdir/$pkgname.pc

  xbuild /property:Configuration=Release src/Db4objects.Db4o/Db4objects.Db4o-2008.csproj
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  gacutil -i src/Db4objects.Db4o/bin/Release/Db4objects.Db4o.dll -package $pkgname-$pkgver -root "$pkgdir/usr/lib/"
  install -Dm644 "$srcdir/$pkgname.pc" "$pkgdir/usr/lib/pkgconfig/$pkgname.pc"
}
