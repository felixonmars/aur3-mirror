# Contributor: Imanol Celaya <ilcra1989@gmail.com>

pkgname=libexds-svn
pkgver=2161
pkgrel=4
pkgdesc="hese are generic data structures and other basic library routines built using the exception handling framework described in exception.h."
arch=('i686') # doesn't work on x86_64
url="http://www.tendra.org/browser/trunk/libexds/"
license=('BSD' 'custom')
makedepends=(bmake)
source=(LICENSE)
md5sums=('e5363c3cc19739fc080b5576e7a620fe')

_svntrunk=http://svn.tendra.org/trunk/
_svnmod=tendra



build() {
  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -r $srcdir/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build/libexds

  #
  # BUILD
  #
  bmake || return 1
  bmake PREFIX=$pkgdir/usr install ||return 1
  install -D -m644 $srcdir/LICENSE $pkgdir/usr/share/licenses/libexds-svn/license
}
