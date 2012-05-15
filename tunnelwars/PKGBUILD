pkgname=tunnelwars
pkgver=0.9.3
pkgrel=3
pkgdesc="This is multi-player action game. It is inspired by old MS-DOS game tunnellers."
url="http://artax.karlin.mff.cuni.cz/~zajio1am/software/tunnelwars/"
license='GPL'
depends=('sdl>=1.2.0' 'glib>=1.2.0' 'guile')
arch=('i686' 'x86_64')
source=(http://artax.karlin.mff.cuni.cz/~zajio1am/software/tunnelwars/$pkgname-$pkgver.tar.gz)
md5sums=('ba1913ed96002265076e554daacd5d8d')

build() { 
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR=$pkgdir install
}
