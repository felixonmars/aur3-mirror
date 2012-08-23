# Maintainer: Douglas Soares de Andrade <dsa@aur.archlinux.org>
# Contributor: phrakture < aaron m griffin * gmail::com >
# Contributor: tardo <tardo@nagi-fanboi.net>

pkgname=python3-beautifulsoup
pkgver=3.1.0.1
pkgrel=2
pkgdesc="Python HTML and XML parser for projects like screen-scraping"
arch=('any')
url="http://www.crummy.com/software/BeautifulSoup"
license=('PSF')
depends=('python3')
#provides=(python-beautifulsoup)
makedepends=(python patch python3)
_rls="BeautifulSoup-$pkgver"
source=(http://www.crummy.com/software/BeautifulSoup/download/3.1.x/$_rls.tar.gz)
md5sums=('69ec3a99c8a2bf2fc03ff6ccaae58491')

build() {
    cd "$srcdir/$_rls"
    
    2to3 -x next --write --no-diffs BeautifulSoup.py BeautifulSoupTests.py \
        setup.py
    
    # Expect hunks 1,2 to fail (already patched by 2to3 program); 3-5 succeed
    ! patch --force BeautifulSoup.py < BeautifulSoup.py.3.diff
    
    patch BeautifulSoupTests.py < BeautifulSoupTests.py.3.diff
}

package() {
    cd "$srcdir/$_rls"
    python3 setup.py install --root="$pkgdir" -O1
}
