
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=ncnyt
pkgver=0.1
pkgrel=1
pkgdesc="NCurses New York Times Reader"
arch=('any')
url="https://github.com/ChimeraCoder/ncnyt"
license=('MIT')
depends=('python2' 'python-aalib' 'python-imaging' 'beautifulsoup4' \
         'python2-urwid' 'python2-lxml')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChimeraCoder/ncnyt/tarball/0.1.0")
md5sums=('f17c320658f8b8f9e4c222fbd9cd1ed6')

package() {
  cd "$srcdir/ChimeraCoder-$pkgname-dd1ba7a"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
