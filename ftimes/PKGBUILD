# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=ftimes
pkgver=3.11.0
pkgrel=1
pkgdesc='system baselining and evidence collection tool'
url='http://ftimes.sourceforge.net/FTimes/'
license=('BSD')
arch=('i686' 'x86_64')
depends=('openssl' 'pcre')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-${pkgver}.tgz)

build() {
   cd $srcdir/$pkgname-$pkgver
   ./configure --prefix=/usr || return 1
   make || return 1
}
package() {
   cd $srcdir/$pkgname-$pkgver
   make DESTDIR=$pkgdir install || return 1
   mkdir $pkgdir/usr/share
   mv $pkgdir/usr/man $pkgdir/usr/share/
   mv $pkgdir/usr/etc $pkgdir/
   install -Dm644 README.LICENSE "$pkgdir/usr/share/licenses/$pkgname/README.LICENSE"
}
md5sums=('cb9ff008b2a9836d888c8e24e0c1a31e')
