# Maintainer: Zack Newman <znewman01@gmail.com>
pkgname=ncnyt
pkgver=0.1
pkgrel=2
pkgdesc="NCurses New York Times Reader"
arch=('any')
url="https://github.com/ChimeraCoder/ncnyt"
license=('MIT')
install='ncnyt.install'
depends=('python2' 'python-aalib' 'python2-beautifulsoup4' \
         'python2-urwid' 'python2-lxml' 'python2-certifi' \
         'python2-chardet' 'python2-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChimeraCoder/ncnyt/tarball/0.1.0")
md5sums=('f17c320658f8b8f9e4c222fbd9cd1ed6')

package() {
  cd "$srcdir/ChimeraCoder-$pkgname-dd1ba7a"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
