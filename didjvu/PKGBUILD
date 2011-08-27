# Contributor: Malkov Fyodor aka krox: iksut@yandex.ru
pkgname=didjvu
pkgver=0.1
pkgrel=1
pkgdesc="didjvu uses the Gamera framework to separate foreground/background layers, which are then encoded into a DjVu file."
arch=('i686' 'x86_64')
url="http://jwilk.net"
license=('GPL2')
depends=('python' 'gamera')
optdepends=()
source=(http://didjvu.googlecode.com/files/$pkgname-$pkgver.tar.gz)
md5sums=('9a219e31a8ecf87571a504e4667266b5')
build() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py build
  python setup.py install --root=$pkgdir    
}

