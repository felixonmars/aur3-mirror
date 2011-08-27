# Maintainer: Thomas Dziedzic < gostrc at gmail >
# Contributor: giniu <gginiu@gmail.com>

pkgname=python-tables-svn
pkgver=4463
pkgrel=1
pkgdesc='Manages hierarchical datasets, efficiently and easily copes with extremely large amounts of data.'
arch=('i686' 'x86_64')
url='http://www.pytables.org/'
license=('BSD')
depends=('python-numpy' 'hdf5' 'zlib' 'python-numexpr' 'cython')
optdepends=('bzip2' 'lzo2')
makedepends=('subversion' 'pyrex' 'setuptools')
options=(!emptydirs)
provides=('python-pytables')
conflicts=('python-pytables')

_svntrunk='http://pytables.org/svn/pytables/trunk/'
_svnmod='Tables'

build() {
  if [ -d $_svnmod ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  python setup.py install --root="$pkgdir" --optimize=1 || return 1
}
