# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: xquiet <matteo@xquiet.eu>

pkgname=yaflight
pkgver=0.99.29
pkgrel=1
pkgdesc="yet another flightgear launch control"
arch=('i686' 'x86_64')
url="http://yaflight.altervista.org"
license=('GPL3')
groups=(Games)
depends=('flightgear' 'yalib1' 'qtwebkit')
makedepends=('qt4>=4.8.3')
source=($pkgname-$pkgver.tar.gz::https://github.com/xquiet/$pkgname/archive/$pkgver.tar.gz
        'yaflight.desktop')
md5sums=('c4cc0223ab013585a6e9996414a886aa'
         '497f2957b0e5828c17f64ac104f431c8')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  qmake-qt4 QMAKE_CXXFLAGS="-Dunix" DATADIR=/usr/share/yaflight
  pushd languages
  lrelease *.ts
  popd
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -m 755 -D $pkgname "$pkgdir/usr/bin/$pkgname"
  install -m 755 -D icons/$pkgname-logo2013-128px.png "$pkgdir/usr/share/icons/$pkgname.png"
  install -m 755 -d "$pkgdir/usr/share/yaflight/languages/"
  install -m 755 -D languages/*qm "$pkgdir/usr/share/yaflight/languages/"
  mkdir -p $pkgdir/usr/share/applications
  cp $srcdir/yaflight.desktop $pkgdir/usr/share/applications/
}
