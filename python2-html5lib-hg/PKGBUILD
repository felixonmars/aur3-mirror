# Contributor: Erol V. Aktay <e.aktay@gmail.com>
# Maintainer: lazni <hdh@lazny.tang.la>

pkgname=python2-html5lib-hg
pkgver=1620
pkgrel=1
pkgdesc="A HTML parser/tokenizer based on the WHATWG HTML5 spec - Mercurial version"
arch=('any')
url="http://code.google.com/p/html5lib/"
license=('MIT')
depends=('python2')
makedepends=('mercurial' 'setuptools')
provides=(python-html5lib)
conflicts=(python-html5lib)
source=()
md5sums=()

_hgroot=https://html5lib.googlecode.com/hg/
_hgrepo=html5lib

build() {
	cd "$srcdir/$_hgrepo/python"
        python2 setup.py install --root=$startdir/pkg || return 1
}
