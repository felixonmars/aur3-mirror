# Contributor: Fazlul Shahriar <fshahriar@gmail.com>
pkgname=scikits-timeseries-svn
pkgver=2222
pkgrel=1
pkgdesc="Library for manipulating, reporting, and plotting time series of various frequencies."
arch=('i686' 'x86_64')
url="http://pytseries.sourceforge.net/"
license=('BSD')
depends=('python' 'python-numpy')
makedepends=('setuptools' 'subversion')
optdepends=('python-scipy: Required for some sub-modules (e.g. interpolate, moving_funcs).'
            'python-matplotlib: Support for plotting time series.'
            'python-pytables: Support for reading/writing HDF5 file format.')
provides=('scikits-timeseries')
conflicts=('scikits-timeseries')
source=()
md5sums=()

_svntrunk=http://svn.scipy.org/svn/scikits/trunk/timeseries
_svnmod=timeseries

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  python setup.py install --root=$pkgdir
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
