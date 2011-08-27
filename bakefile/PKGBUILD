# Maintainer:  TDY <tdy@gmx.com>
# Contributor: Darren LaChausse <dlachausse@yahoo.com>

pkgname=bakefile
pkgver=0.2.9
pkgrel=2
pkgdesc="A cross-platform, cross-compiler native makefiles generator"
arch=('i686' 'x86_64')
url="http://bakefile.sourceforge.net/"
license=('MIT')
depends=('python2')
options=('!libtool')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('b53813d155df1a45371abc8f781e6d88')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  ln -sf ../lib/bakefile/bakefile.py "$pkgdir/usr/bin/bakefile"
  ln -sf ../lib/bakefile/bakefile_gen.py "$pkgdir/usr/bin/bakefile_gen"
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
