#contributor: benetnash<starbreaker@op.pl>
pkgname=gai-visual-audio
pkgver=0.3
pkgrel=2
pkgdesc="GAI Visual Audio displays the specturm or scope of the audio that is played by XMMS"
url="http://gai.sourceforge.net/"
license="GPL"
depends=('gai')
makedepends=('make')
source=(http://dl.sourceforge.net/sourceforge/gai/$pkgname-$pkgver.tar.bz2)
md5sums=('f7d2d0ca6b7f43d3ec115d537f30ce1c')

build() {
  cd $startdir/src/$pkgname-$pkgver
  ./configure --prefix=/usr
  make || return 1
  make PREFIX=$startdir/pkg/usr install
}

