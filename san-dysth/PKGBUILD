# Contributor: hb <hb.at.spamers.dot.net>

pkgname=san-dysth
pkgver=0.1.1
pkgrel=1
pkgdesc="A standalone realtime soft-synth written in SND."
arch=('i686')
url="http://www.notam02.no/~kjetism/sandysth/"
license=('GPL')
depends=('snd-ls' 'rev-plugins')
source=(http://www.notam02.no/arkiv/src/$pkgname-$pkgver.tar.gz)
md5sums=('8ef6db4d4f8e8cfc701e0686eca907dc')


build() {
  install -d $startdir/pkg/usr/{bin,share}
  cd $startdir/src/$pkgname-$pkgver
  patch -p0 < $startdir/patch.diff
  sed -e 's_/local__g' -i Makefile
  make DESTDIR=$startdir/pkg install
}
