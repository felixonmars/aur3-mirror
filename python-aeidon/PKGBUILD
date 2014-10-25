# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=python-aeidon
_appname=gaupol
pkgver=0.26
pkgrel=1
pkgdesc="Python package for reading, writing and manipulating text-based subtitle files"
arch=('any')
url="http://home.gna.org/gaupol"
license=('GPL')
depends=('python')
makedepends=('python-setuptools' 'gettext' 'intltool')
optdepends=('python-chardet: character encoding detection'
            'python-pyenchant: spell-checking'
            'iso-codes: translate language and country codes for spell-checker')
source=("http://download.gna.org/$_appname/$pkgver/$_appname-$pkgver.tar.xz")
conflicts=("gaupol" "gaupol-git")
md5sums=('001e822f613e0e489cc1657ee859d71e')


build() {
  cd "$srcdir/$_appname-$pkgver"

  python setup.py --without-gaupol build
}

package() {
  cd "$srcdir/$_appname-$pkgver"

  python setup.py --without-gaupol install --root=$pkgdir --prefix=/usr
}
