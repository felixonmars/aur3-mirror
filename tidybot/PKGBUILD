# Contributor: Nathan Owe. <ndowens04 at gmail>

pkgname=tidybot
pkgver=1.6.1
pkgrel=1
pkgdesc="cross-platform batch (X)HTML syntax-checker and report-generator."
arch=('any')
url="http://www.kronto.org/tidybot/"
source=(http://www.kronto.org/tidybot/download/$pkgname-$pkgver.tar.gz)
license=('MIT')
md5sums=('ce08f18e1cf96cebda030b9df02a8937')
depends=('python' 'python-utidylib')
options=('!emptydirs')

build() {
  cd $srcdir/$pkgname-$pkgver
  python setup.py install --root=$pkgdir/
    install -D -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}


