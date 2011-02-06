# Maintainer: TDY <tdy@gmx.com>

pkgname=geh
pkgver=20100526
pkgrel=1
pkgdesc="A simple image viewer and background setter"
arch=('i686' 'x86_64')
url="http://pekwm.org/projects/5/"
license=('MIT')
depends=('gtk2>=2.8.0')
makedepends=('pkgconfig>=0.16')
source=($pkgname-$pkgver.tar.bz2::http://pekwm.org/projects/5/repository/snapshot?revision=490b17fd270707447419333ceb7bde85eca01a99)
md5sums=('ce4ad23fd3c84522be2970d07e2df4bc')

build() {
  cd "$srcdir/$pkgname"
  sed -n '2,22 s/ \*[ ]*//p' src/main.c > license.txt
  ./autogen.sh && ./configure --prefix=/usr
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 src/$pkgname "$pkgdir/usr/bin/$pkgname"
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
