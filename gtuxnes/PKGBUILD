# Contributor: Matt Beisser <beissemj@gmail.com>
pkgname=gtuxnes
pkgver=0.75
pkgrel=1
pkgdesc="Frontend for TuxNES"
arch=(i686)
url="http://www.scottweber.com/projects/gtuxnes/"
license=('GPL')
depends=('gtk>=1.2.8' 'tuxnes')
source=(http://www.sourcefiles.org/Emulators/Videogames/$pkgname-$pkgver.tar.gz)
md5sums=('19355f3c08dfa3a8b56dbececf22bfea')

build() {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  mkdir -p $startdir/pkg/usr/bin
  install -m 755 $pkgname $startdir/pkg/usr/bin
}

