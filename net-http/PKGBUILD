# Maintainer: Alexander Minges <alexander.minges@gmail.com>
pkgname=net-http
pkgver=0.3.1
pkgrel=1
pkgdesc="Library for doing HTTP client-side programming in Guile"
arch=('i686' 'x86_64')
url="http://evan.prodromou.name/software/net-http"
license=('GPL')
depends=('guile')
source=(http://evan.prodromou.name/software/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('4a89e51921604c0d1201df8524e49e68cbe4a831ff76382b045d8f9a920c8bfe')

build() {
  cd "$srcdir/$pkgname"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname"
  
  install -d $pkgdir/usr/share/guile/net/http
  install -d $pkgdir/usr/share/doc/$pkgname
  install -Dm644 $srcdir/$pkgname/net/*.scm $pkgdir/usr/share/guile/net
  install -Dm644 $srcdir/$pkgname/net/http/*.scm $pkgdir/usr/share/guile/net/http
  install -Dm644 $srcdir/$pkgname/README $pkgdir/usr/share/doc/$pkgname/README
} 
