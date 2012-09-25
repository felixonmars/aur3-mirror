# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>

pkgname=cdlabelgen
pkgver=4.2.0
pkgrel=1
pkgdesc="Generates frontcards and traycards for CDs."
arch=('i686' 'x86_64')
url="http://www.aczoom.com/tools/cdinsert/"
license=('MIT')
depends=('perl')
source=(http://www.aczoom.com/pub/tools/$pkgname-$pkgver.tgz)
md5sums=('55224cb4e7217763300535ed4ba826f8')


build() {
  cd $srcdir/$pkgname-$pkgver
  install -d $pkgdir/usr/share/man/man1 
  make BASE_DIR=$pkgdir/usr install || return 1
#  install -D -m644 ../LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
