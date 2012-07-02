pkgname=pytvshows-plus
pkgver=0.2.2
pkgrel=1
pkgdesc="This is maintenance fork of the original pytvshows script by Ben Firshman."
arch=('i686' 'x86_64')
url="http://code.google.com/p/pytvshows-plus/"
license=('GPL')
depends=('python2' 'python2-feedparser')
install=
source=(http://pytvshows-plus.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('5f824b3254f0f8f5f43c11a005bcc4d5')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root $pkgdir
  
}
