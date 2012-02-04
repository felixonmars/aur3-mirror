# Contributor: furester <furester at gmail dot com>

pkgname="python-etk-svn"
pkgver=37309
pkgrel="1"
pkgdesc="ETK is a toolkit based on the EFL (Python bindings)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('etk-svn' 'python')
makedepends=('svn' 'cython' 'pyrex')
conflicts=('pyetk')
provides=('pyetk')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-etk/"
_svnmod="python-etk"

build() {
  cd $srcdir

  msg "Connecting to $_svntrunk SVN server...."
  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  _incdir=`python -c "import distutils.sysconfig; \
      print distutils.sysconfig.get_python_inc()"`
  python setup.py install --root="$pkgdir" \
      install_headers --install-dir="$pkgdir/${_incdir}" || return 1

# install license files
  install -Dm644 $srcdir/$_svnmod-build/COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
  install -Dm644 $srcdir/$_svnmod-build/COPYING-PLAIN $pkgdir/usr/share/licenses/$pkgname/COPYING-PLAIN
    
  rm -r $srcdir/$_svnmod-build
}
