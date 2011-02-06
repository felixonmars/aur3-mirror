# Contributor: Roberto Alsina <ralsina@kde.org>
pkgname=gibberish
pkgver=0.2
pkgrel=5
pkgdesc="Test if your tcp-server can handle gibberish"
arch=('i686')
url="http://www.vanheusden.com/Linux/index.php"
license=("GPL")
depends=('glibc')
source=(http://www.vanheusden.com/Linux/$pkgname-$pkgver.tar.gz gibberish.1)
md5sums=('6a4c8f175ffa36b98769a126baf34303' '1b65819d330f42ead771440d505038e2')

build() {
  cd $startdir/src/$pkgname
  make || return 1
  install -d $startdir/pkg/usr/bin
  install -m 0755 gibberish $startdir/pkg/usr/bin
  install -d $startdir/pkg/usr/man/man1
  install -m 0644 ../gibberish.1  $startdir/pkg/usr/man/man1
}
