# Contributor: Rémi Audebert <quaero.galileo@gmail.com>

pkgname=python2-wikitools
pkgver=1.1.1
pkgrel=1
pkgdesc="Python scripts and modules to interact with the MediaWiki API"
arch=('any')
url="http://code.google.com/p/python-wikitools/"
license=('cc-by-sa-3.0' 'GPL3')
depends=('python2'
         'python-simplejson')
optdepends=('python-poster: file upload support')
source=('http://python-wikitools.googlecode.com/files/wikitools-1.1.1.tar.gz')
md5sums=('914ee078fc9e41158ed43960b6af0804')

build() {
    cd "$srcdir/wikitools-$pkgver"

    msg "Starting setup.py..."
    python2 setup.py install --root=$pkgdir/ --optimize=1
}
