pkgname='oroboros'
pkgver='20080712'
pkgrel='1'
pkgdesc='An astrology software written in Python.'
arch=('i686' 'x86_64')
license=('GPL')
url='http://pypi.python.org/pypi/oroboros'
depends=('pyswisseph' 'python2-pytz' 'python2-pyqt' 'swisseph-fixstars' 'swisseph_18')
makedepends=('setuptools')
optdepends=('docutils' 'mercurial' 'supybot')
source=("http://pypi.python.org/packages/source/o/oroboros/oroboros-20080712.tar.bz2")
md5sums=('c220e7bb11e0c4efd568e656267caff8')

build() {
    cd $srcdir/$pkgname-$pkgver/
    python2 setup.py install --root=$pkgdir || return 1
}
