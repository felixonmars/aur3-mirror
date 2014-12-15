# Maintainer: Kniyl <mathias dot ettinger at gmail dot com>
# Contributor: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgname=python-beautifulsoup4-4.1
pkgver=4.1.3
pkgrel=2
pkgdesc="A Python HTML/XML parser designed for quick turnaround projects like screen-scraping"
arch=('any')
url="http://www.crummy.com/software/BeautifulSoup/index.html"
license=('PSF')
depends=('python')
optdepends=('python-chardet: universal encoding detector'
            'python-lxml: pythonic binding for the libxml2 and libxslt libraries')
makedepends=('python' 'python-setuptools')
source=("http://www.crummy.com/software/BeautifulSoup/bs4/download/${pkgver%.*}/beautifulsoup4-${pkgver}.tar.gz")
md5sums=('5aece3c0b8a080658155958111fa2fa9')

build() {
  cd "${srcdir}/beautifulsoup4-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/beautifulsoup4-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build

  rm -rf ${pkgdir}/usr/lib/python3.4/site-packages/bs4/tests
}
