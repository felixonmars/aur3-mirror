# Contributor: kalio

pkgname=pygtkmoz
pkgver=0.1
pkgrel=4
pkgdesc="Python bindings for gtkmozembed"
license=('LGPL')
arch=('i686' 'x86_64')
url="http://pygtkmoz.sourceforge.net/"
depends=('python2' 'gtk2' 'nspr')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz)
md5sums=('52e8318434090d4f35ab1745f26077a0')

build () {
  cd $startdir/src/$pkgname-$pkgver
  make || return 1
  python2 setup.py install --prefix=/usr --root="$pkgdir" || return 1
}
