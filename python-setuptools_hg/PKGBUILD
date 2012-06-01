# Maintainer: Bruno Carlin <self at aerdhyl dot eu>
pkgname=python-setuptools_hg
pkgver=0.4
pkgrel=1
pkgdesc="Setuptools plugin for finding files under Mercurial version control."
arch=(any)
url="http://bitbucket.org/jezdez/setuptools_hg"
license=('GPL2')
depends=('python' 'python-distribute' 'mercurial')
makedepends=('tar' 'gzip')
source=("http://pypi.python.org/packages/source/s/setuptools_hg/setuptools_hg-$pkgver.tar.gz")

md5sums=('1435518e523f2d2296294c9abc37a7c7')
options=(!emptydirs)

build() {
  cd $srcdir/setuptools_hg-$pkgver
  python setup.py install --root=$pkgdir/ --optimize=1
}
