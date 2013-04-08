# Maintainer: Tanner Danzey <arkaniad@gmail.com>
pkgname=bff
pkgver=1.0.5
pkgrel=1
pkgdesc="A moderately-optimizing BF interpreter"
arch=(i686 x86_64)
url="http://swapped.cc/bf/"
license=('BSD')
depends=()
provides=('bff')
source=(https://github.com/apankrat/bff/archive/v$pkgver.zip)
md5sums=('4a1357f332e1acfb2378b039cdd46140')


build() {
  cd "$srcdir/$pkgname-$pkgver"
  make || return 1
  install -Dm755 bff $pkgdir/usr/bin/bff
  install -Dm644 README.md $pkgdir/usr/share/bff/README
  install -Dm644 samples/mandelbrot.b $pkgdir/usr/share/bff/samples/mandelbrot.b
  install -Dm644 samples/random.b $pkgdir/usr/share/bff/samples/random.b
}

# vim:set ts=2 sw=2 et:
