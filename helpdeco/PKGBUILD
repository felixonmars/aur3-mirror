# Contributor: tocer deng <tocer.deng@gmail.com>
pkgname=helpdeco
pkgver=2.1.3
pkgrel=1
pkgdesc="A software which will recreate all source files from all Windows 3.x/'95 .HLP help files and most .MVB multi media viewer titles."
arch=('i686' 'x86_64')
url="http://www.geocities.com/mwinterhoff/helpdeco.htm"
license=('GPL')
conflicts=('helpdeco')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('3185e61e6ac17508cd60e34760c2f4f8')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  make || return 1
  mkdir $pkgdir/usr
  make prefix="$pkgdir/usr" install
}

