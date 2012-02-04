# Maintainer: Pierre Bourdon <delroth@gmail.com>

pkgname=pyfs-svn
pkgver=592
pkgrel=1
pkgdesc="Python module that provides a common interface to many filesystems"
arch=(any)
url="http://code.google.com/p/pyfilesystem/"
license=('BSD')
depends=('python2')
makedepends=('subversion')
provides=('pyfs')
conflicts=('pyfs')
replaces=('pyfs')
options=(!emptydirs)
source=()
md5sums=()

_svntrunk='http://pyfilesystem.googlecode.com/svn/trunk/'
_svnmod=pyfs

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
}

package() {
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root=$pkgdir/ --optimize=1

  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
