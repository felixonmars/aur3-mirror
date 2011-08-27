# Contributor: Lucas Hermann Negri <lucashnegri@gmail.com>

pkgname=ecspy
pkgver=0.7
pkgrel=1
pkgdesc="Free, open source framework for creating evolutionary computations in Python."
arch=(any)
url="http://code.google.com/p/ecspy/" 
depends=('python2')
license=('GPL')
source=("http://ecspy.googlecode.com/files/$pkgname-$pkgver.zip")
md5sums=("79732d9a07204edfd0a4b1cea4a9e74e")

build() { 
  cd "$srcdir/$pkgname-$pkgver"
  mkdir -p "$pkgdir/usr/lib/python2.7"
  cp -r ecspy "$pkgdir/usr/lib/python2.7/"
}
