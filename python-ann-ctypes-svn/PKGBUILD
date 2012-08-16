# Maintainer: Fazlul Shahriar <fshahriar@gmail.com>
pkgname=python-ann-ctypes-svn
pkgver=2077
pkgrel=2
pkgdesc="Python ctypes wrapper around Approximate Nearest Neighbor library."
arch=('i686' 'x86_64')
url="http://www.scipy.org/scipy/scikits/wiki/AnnWrapper"
license=('MIT' 'BSD')
depends=('ann' 'python2-numpy')
makedepends=('subversion')
source=(missing-hdr.patch MIT-LICENSE BSD-LICENSE)
md5sums=('2dc5aadcdcb987360e408ca2ac840465'
         '212852855df110b1bf2409e5d4c39b8e'
         '1232e67526fc5788e9f874758e84d62b')

_svntrunk=http://svn.scipy.org/svn/scikits/trunk/ann/ann-ctypes
_svnmod=ann-ctypes

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

  patch -p0 < $srcdir/missing-hdr.patch
  python2 setup.py install --root=$pkgdir

  install -Dm644 ${srcdir}/MIT-LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/MIT-LICENSE
  install -Dm644 ${srcdir}/BSD-LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/BSD-LICENSE
}

# vim:set ts=2 sw=2 et:
