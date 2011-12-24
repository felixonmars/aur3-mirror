# Contributor: lp76 <l.peduto@gmail.com>
pkgname=screenie
pkgver=20110213
pkgrel=1
pkgdesc="Small and lightweight GNU screen wrapper"
url="http://pubwww.fhzh.ch/~mgloor/screenie.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('screen' 'awk')
source=(http://downloads.sourceforge.net/project/screenie/$pkgname-$pkgver.tar.gz)
md5sums=('6ebb72bf8c878389f88e8e6611f6b3aa')

build() {
  cd $srcdir/$pkgname
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  gzip screenie.1
  install -m 0755 screenie $pkgdir/usr/bin
  install -m 0644 screenie.1.gz $pkgdir/usr/share/man/man1 
}
