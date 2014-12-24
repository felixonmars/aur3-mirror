# Maintainer: Robert Orzanna <orschiro@gmail.com>
pkgname=python2-academicmarkdown
_pkgname=academicmarkdown
pkgver=0.8.1
pkgrel=1
pkgdesc="Academic writing with Markdown "
arch=(any)
url="https://github.com/smathot/academicmarkdown"
license=('GPL')
depends=('python2' 'pandoc' 'pyzotero' 'wkhtmltopdf')
source=(https://github.com/smathot/academicmarkdown/archive/release/$pkgver.tar.gz)
md5sums=('d5eac4588122d3cc22506474c92dcc93')

package() {
  cd "$srcdir/$_pkgname-release-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:

