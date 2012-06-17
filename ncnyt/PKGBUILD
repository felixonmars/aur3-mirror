# Maintainer: Zack Newman <znewman01@gmail.com>
pkgname=ncnyt
pkgver=0.3.0
pkgrel=2
pkgdesc="NCurses New York Times Reader"
arch=('any')
url="https://github.com/ChimeraCoder/ncnyt"
license=('MIT')
install='ncnyt.install'
depends=('python2' 'python2-aalib' 'python2-beautifulsoup4' \
         'python2-urwid' 'python2-lxml' 'python2-certifi' \
         'python2-chardet' 'python2-requests')
source=("http://pypi.python.org/packages/source/n/ncnyt/ncnyt-$pkgver.tar.gz")
md5sums=('67a69efacfbc3202c3555bc8896f32e6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
