# Maintainer: willemw <willemw12@gmail.com>

pkgname=pywapi
pkgver=0.3.6
pkgrel=1
pkgdesc="Python wrapper around the Yahoo! Weather, Weather.com and NOAA APIs"
arch=('any')
url="http://code.google.com/p/python-weather-api"
source=(http://python-weather-api.googlecode.com/files/$pkgname-$pkgver.tar.gz)
license=('MIT')
depends=('python')
md5sums=('f55dbbb539baec9e729e172a37c3a417')

package() {
  cd $pkgname-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

