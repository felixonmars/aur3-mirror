# Maintainer: TDY <tdy@archlinux.info>

pkgname=cutoggvorbis
pkgver=0.2
pkgrel=1
pkgdesc="A small, fast command-line Ogg/Vorbis editor"
arch=('i686' 'x86_64')
url="http://www.puchalla-online.de/cutoggvorbis/cutoggvorbis.html"
license=('GPL')
depends=('vorbis-tools')
source=(http://puchalla-online.de/$pkgname/$pkgname-$pkgver.tar.bz2)
md5sums=('742c5f7a376480464aeb82af1d18754a')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.1.gz "$pkgdir/usr/share/man/man1/$pkgname.1.gz"
}

# vim:set ts=2 sw=2 et:
