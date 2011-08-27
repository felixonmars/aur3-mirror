# Contributor: Imanol Celaya <ilcra1989@gmail.com>

pkgname=tendra-svn
pkgver=2161
pkgrel=5
pkgdesc="TenDRA C Compiler"
arch=('i686') # doesn't work on x86_64
url="http://www.tendra.org/"
license=('BSD' 'custom')
makedepends=(bmake andfutils-svn)
install=tendra.install
source=(LICENSE)
md5sums=('e5363c3cc19739fc080b5576e7a620fe')

_svntrunk=http://svn.tendra.org/trunk
_svnmod=tendra

build() {
  cd $startdir/src

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $srcdir/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/tendra

  #
  # BUILD
  #
  PREFIX=$pkgdir/opt/tendra ./makedefs || return 1
  bmake -DBOOTSTRAP || return 1
  bmake || return 1
  bmake install || return 1
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/tendra-svn/license
}
