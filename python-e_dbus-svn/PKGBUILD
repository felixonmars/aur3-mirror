# Contributor: furester <furester at gmail dot com>

pkgname="python-e_dbus-svn"
pkgver=35558
pkgrel="1"
pkgdesc="e_dbus integrate dbus with EFL based applications (Python bindings)"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('BSD')
depends=('e_dbus-svn' 'python')
makedepends=('svn' 'cython' 'pyrex')
conflicts=('pye_dbus')
provides=('pye_dbus')
source=()
md5sums=()

_svntrunk="http://svn.enlightenment.org/svn/e/trunk/BINDINGS/python/python-e_dbus/"
_svnmod="python-e_dbus"

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
    
  rm -r $srcdir/$_svnmod-build
}


