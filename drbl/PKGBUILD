# Mantainer: M0Rf30
pkgname=drbl
pkgver=2.1.3
pkgrel=1
pkgdesc="DRBL (Diskless Remote Boot in Linux) is a free software, open source solution to managing the deployment of the GNU/Linux operating system across many clients."
arch=('i686' 'x86_64')
url="http://drbl.sourceforge.net/"
license=('GPL')
depends=('bash' 'bc' 'vim')
source=(http://free.nchc.org.tw/drbl-core/src/experimental/$pkgname-$pkgver.tar.bz2)

build() {
  cd $srcdir/$pkgname-$pkgver
  make  
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

md5sums=('b49aa49e47571f84a7636babb5971814')
