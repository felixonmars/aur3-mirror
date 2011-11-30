# Maintainer: Florian Léger <florian6 dot leger at laposte dot net>

pkgname=python2-aeidon
_appname=gaupol
pkgver=0.19.2
pkgrel=1
pkgdesc="Python package for reading, writing and manipulating text-based subtitle files"
arch=('any')
url="http://home.gna.org/gaupol"
license=('GPL')
depends=('python2')
makedepends=('python2-distribute' 'gettext' 'intltool')
optdepends=('python2-chardet: character encoding detection'
            'pyenchant: spell-checking'
            'iso-codes: translate language and country codes for spell-checker')
source=("http://download.gna.org/$_appname/0.19/$_appname-$pkgver.tar.gz")
conflicts=("gaupol")
md5sums=('1dc5e7ff23d92cbc6aa1affbadcb1747')

build() {
  cd "$srcdir/$_appname-$pkgver"

  python2 setup.py --without-gaupol build
}

package() {
  cd "$srcdir/$_appname-$pkgver"

  python2 setup.py --without-gaupol install --root=$pkgdir -O1
}
