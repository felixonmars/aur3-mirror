# Contributor: Nathan Owe. <ndowens04 at gmail>
# Maintainer: Thomas Zervogiannis <tzervo@gmail.com>

pkgname=python-tinyurl
pkgver=0.1.0
pkgrel=2
pkgdesc="Command-line interface to tinyurl.com"
arch=('i686' 'x86_64')
url="http://pypi.python.org/pypi/TinyUrl/0.1.0"
source=(http://pypi.python.org/packages/source/T/TinyUrl/TinyUrl-$pkgver.tar.gz 'LICENSE')
license=('MIT')
md5sums=('23c2a6ebfb490b45a838257f427a2274' '4a647bb0c05cbec72713b634e5bafba8')
depends=('python2')
options=(!emptydirs)

build() {
  cd $srcdir/TinyUrl-$pkgver
  install -d $pkgdir/usr/share/licenses/$pkgname
  python2 setup.py install --root=$pkgdir/
  
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/
}


