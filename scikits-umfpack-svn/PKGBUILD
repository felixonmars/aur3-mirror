# Maintainer: Renato Coutinho <renato.coutinho@gmail.com>
pkgname=scikits-umfpack-svn
pkgver=2194
pkgrel=1
pkgdesc="UMFPACK sparse direct solver for SciPy."
arch=('i686' 'x86_64')
url="http://scikits.appspot.com/umfpack"
license=('BSD')
depends=('python2' 'python2-numpy' 'python2-scipy' 'scikits-base' 'umfpack')
makedepends=('python2-distribute' 'subversion')
source=()
md5sums=()

_svntrunk=http://svn.scipy.org/svn/scikits/trunk/umfpack
_svnmod=umfpack

build() {
  cd ${srcdir}

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

  # ugly, but works
  # ignores any LDFLAGS set in makepkg.conf
  unset LDFLAGS

  python2 setup.py install --root=${pkgdir}
  rm ${pkgdir}/usr/lib/python2.7/site-packages/scikits/__init__.py
}

