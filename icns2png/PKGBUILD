# Maintainer: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=icns2png
pkgver=0.7
pkgrel=3
pkgdesc="A utility to convert Mac icons to PNG images."
arch=('i686' 'x86_64')
url="http://www.eisbox.net/dev/icns2png"
license=('GPL')
depends=('libpng12' 'zlib')
source=(http://www.eisbox.net/software/icns2png-$pkgver.src.tgz)
md5sums=('040c59d900303f667eeaed4c738bc92b')

build() {
cd $srcdir/$pkgname
mkdir -p $pkgdir/usr/bin
make || return 1
make prefix=$pkgdir/usr install || return 1
install -D -m644 $srcdir/$pkgname/README $pkgdir/usr/share/licenses/icns2png/README
}
