# Contributor: Artiom Molchanov <ar.molchanov@gmail.com>
pkgname=lpairs
pkgver=1.0.4
pkgrel=2
pkgdesc="A classical memory game"
arch=(x86_64 i686)
url="http://lgames.sourceforge.net/index.php?project=LPairs"
license=('GPL')
depends=(sdl)
source=(http://prdownloads.sourceforge.net/lgames/$pkgname-$pkgver.tar.gz)
md5sums=('5eb00da9f7fc15dc5ce840c312e76cfa')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make || return 1

}


package() {

  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  
  mkdir -p $pkgdir/usr/share/applications
  install -m644 lpairs.desktop $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/share/pixmaps
  install -m644 lpairs.png $pkgdir/usr/share/pixmaps/
}
