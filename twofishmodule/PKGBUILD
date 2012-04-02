# Maintainer: Rohit R <rrohit.rht@gmail.com>
pkgname=twofishmodule
pkgver=0.7
pkgrel=1
pkgdesc="TwoFish Encryption module for Python"
arch=('any')
url="http://twofish-py.sourceforge.net/twofish-py.html"
license=('custom')
depends=('python2')
source=("http://sourceforge.net/projects/twofish-py/files/twofish-py/0.7/$pkgname-$pkgver.tar.gz" 'newline.patch' 'python2.patch' 'destdir.patch')
md5sums=('557f60dc6d37a6eb43ade9ec52f71556'
         '98aaff9ca68a87ae8c9645bddccbccb6'
         '5e4c0b1ca2126c5cb06bf70980cecebe'
         '834926020ce3b188afc108270089e1f9')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch configure -i $srcdir/python2.patch
  patch twofishmodule.c -i $srcdir/newline.patch
  patch Makefile.in -i $srcdir/destdir.patch
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}