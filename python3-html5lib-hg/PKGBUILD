# Contributor: Erol V. Aktay <e.aktay@gmail.com>
# Maintainer: lazni <hdh@lazny.tang.la>

pkgname=python3-html5lib-hg
pkgver=1620
pkgrel=1
pkgdesc="A Python3 HTML parser/tokenizer based on the WHATWG HTML5 spec - Mercurial version"
arch=('any')
url="http://code.google.com/p/html5lib/"
license=('MIT')
depends=('python3')
makedepends=('mercurial' 'setuptools')
provides=(python3-html5lib)
conflicts=(python3-html5lib)
source=()
md5sums=()

_hgroot=https://html5lib.googlecode.com/hg/
_hgrepo=html5lib

build() {
	cd "$srcdir/$_hgrepo/python3"
        python3 setup.py install --root=$startdir/pkg || return 1
}