# Contributor: Andreas B. Wagner <AndreasBWagner@pointfree.net>
pkgname=m9u
pkgver=0.5
pkgrel=2
pkgdesc="A music server/player with a file system interface"
arch=('i686' 'x86_64')
url="http://sqweek.dnsdojo.org/code/m9u/"
license=('MIT')
depends=('libixp>=0.5')
source=(http://sqweek.net/9p/$pkgname-$pkgver.tar.gz)
md5sums=('6140921720cc6bfdf269ccba9628e6d7')

build() {
  cd $srcdir/$pkgname-$pkgver
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=${pkgdir}/usr install
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
