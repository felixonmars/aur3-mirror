# Contributor: Nathan Owe <ndowens.aur at gmail dot com>
pkgname=wire
pkgver=2010.06.09
pkgrel=1
pkgdesc="A screen-oriented command line Wired client."
arch=(i686 x86_64)
url="http://www.zankasoftware.com/wired/wire/"
license=(BSD)
depends=(openssl)
source=("http://www.zankasoftware.com/nightly/wire-${pkgver//./-}.tar.gz")
md5sums=('96def6134634f7c1b1e79a4c4515d721') 

build() {
  cd "$srcdir/$pkgname-1.1.3"
  ./configure --prefix=/usr
  make 
}
package() {
  cd "$srcdir/$pkgname-1.1.3"
  make DESTDIR=$pkgdir bindir=$pkgdir/usr/bin mandir=$pkgdir/usr/share/man install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
