# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname=gcovr-svn
pkgver=2575
pkgrel=2
pkgdesc="The gcovr script applies the Unix gcov command and generate a simple report that summarizes the coverage. "
arch=('x86_64' 'i686')
url="https://software.sandia.gov/trac/fast/wiki/gcovr"
license=('custom')
makedepends=('subversion' 'python2' 'python2-distribute')
depends=('python2' 'python2-distribute')

_svntrunk=https://software.sandia.gov/svn/public/fast/gcovr/trunk
_svnmod=gcovr

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

  #
  # BUILD
  #
}

package() {
  cd "$srcdir/$_svnmod-build"
  python2 setup.py install --root="$pkgdir/"
  install -D -m644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE.txt || return 1
}
