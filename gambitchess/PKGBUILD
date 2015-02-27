# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=gambitchess
pkgver=1.0.3
pkgrel=1
pkgdesc="A cross-platform chess game."
arch=('i686' 'x86_64')
url="http://gambitchess.sourceforge.net/"
license=('custom:Creative Commons 1.0 Universal')
depends=('qt4')
makedepends=('cmake')
source=(http://sourceforge.net/projects/$pkgname/files/Gambit-$pkgver/Gambit-$pkgver-src.tar.bz2
              $pkgname
              $pkgname.desktop)
md5sums=('1ac10d092a6cd0fab97f773411864250'
         '3bb946fcd6597572a9fa0c06b72d0889'
         '61b9b4f7694f8b5cc4048a743158fef8')

prepare() {
  cd $srcdir/Gambit-$pkgver-src
  cmake .
  sed -i '1iCONFIG_GUPTA_ENGINE_DIRECTORY:FILEPATH=/usr/share/gambitchess' CMakeCache.txt
}

build() {
  # Build GUI
  cd $srcdir/Gambit-$pkgver-src  
  make

  # Build 'gupta' chess engine, release version
  cd engine/gupta
  make release
}

package() {
  cd $srcdir/Gambit-$pkgver-src
  # Install GUI
  install -Dm755 $pkgname $pkgdir/usr/share/$pkgname/$pkgname

  # Install 'gupta' chess engine
  install -Dm755 engine/gupta/gupta $pkgdir/usr/share/$pkgname/engine/gupta/gupta

  # Install data (icons, pieces, translations, etc...)
  cp -r data/ $pkgdir/usr/share/$pkgname

  # License
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

  # Desktop file
  install -Dm644 artwork/icons/gambit/gambit.svg $pkgdir/usr/share/pixmaps/$pkgname.svg
  cd ..
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  # Start file
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
}