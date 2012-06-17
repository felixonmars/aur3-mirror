# Maintainer: Kirt Lillywhite <kirt.lillywhite@gmail.com

pkgname=python2-beautifulsoup4
pkgver=4.1.0
pkgrel=1
pkgdesc="Python HTML and XML parser for projects like screen-scraping"
arch=('any')
url="http://www.crummy.com/software/BeautifulSoup"
license=('PSF')
depends=('python')
provides=(python-beautifulsoup)
makedepends=(python2)
_rls="BeautifulSoup-$pkgver"
source=(http://www.crummy.com/software/BeautifulSoup/bs4/download/4.0/beautifulsoup4-$pkgver.tar.gz)
md5sums=('bf69362be7d0c32515872f944763658b')

package() {
    cd "$srcdir/beautifulsoup4-$pkgver"
    python2 setup.py install --root="$pkgdir"
}

