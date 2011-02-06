# Contributor: Daniele Paolella <dp@mcrservice.it>
pkgname=python-medusa
pkgver=0.5.4
pkgrel=1
pkgdesc="A framework for implementing asynchronous servers"
arch=('i686' 'x86_64')
url="http://www.amk.ca/python/code/medusa.html"
license=('Python')
depends=('python')
source=("http://www.amk.ca/files/python/medusa-$pkgver.tar.gz")
md5sums=('5d10505036bc38f8d4cb51d87516e069')

build() {
  cd "$srcdir/medusa-$pkgver"
  python setup.py install --prefix=/usr --root="$pkgdir" || return 1
  install -D -m644 "$srcdir/medusa-$pkgver/LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
