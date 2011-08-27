# Maintainer: TDY <tdy@gmx.com>

pkgname=solarbeam
pkgver=1.0
pkgrel=1
pkgdesc="An application for drawing solar diagrams"
arch=('i686' 'x86_64')
url="http://solarbeam.sourceforge.net/"
license=('GPL')
depends=('mono>=2.0')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.zip
        $pkgname.launcher)
noextract=($pkgname-$pkgver.zip)
md5sums=('dceea39eab27c17ce30f1378d3c4ab34'
         '33e7144717819da61ba4a416f18bc5fe')

build() {
  cd "$srcdir"
  install -dm755 "$pkgdir/usr/share"
  bsdtar -xf $pkgname-$pkgver.zip -C "$pkgdir/usr/share"
  install -Dm755 $pkgname.launcher "$pkgdir/usr/bin/$pkgname"
}
