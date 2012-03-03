# Maintainer: Kirt Lillywhite <kirt.lillywhite@gmail.com

pkgname=beautifulsoup4
pkgver=4.0.0b10
pkgrel=1
pkgdesc="Python HTML and XML parser for projects like screen-scraping"
arch=('any')
url="http://www.crummy.com/software/BeautifulSoup"
license=('PSF')
depends=('python')
provides=(python-beautifulsoup)
makedepends=(python)
_rls="BeautifulSoup-$pkgver"
source=(http://www.crummy.com/software/BeautifulSoup/download/3.1.x/$_rls.tar.gz)
source=(http://www.crummy.com/software/BeautifulSoup/bs4/download/4.0/$pkgname-$pkgver.tar.gz)
md5sums=('65bc40428881dec5292e8eb683444497')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir"
}

