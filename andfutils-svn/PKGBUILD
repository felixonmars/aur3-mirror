# Contributor: Imanol Celaya <ilcra1989@gmail.com>

pkgname=andfutils-svn
pkgver=2161
pkgrel=3
pkgdesc="different utilities needed to build TenDRA C Compiler"
arch=('i686') # doesn't work on x86_64
url="http://www.tendra.org/browser/trunk/andfutils"
license=('custom')
depends=(libexds-svn)
makedepends=(bmake)
source=(LICENSE)
md5sums=('71633dfbc9f2c904a1daefd3eaa241a2')

_svntrunk=http://svn.tendra.org/trunk
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
  cd $_svnmod-build

  #
  # BUILD
  #
  
  # Build tld
  cd andfutils/src/tld
  bmake || return 1
  install -D -m755 tld $pkgdir/usr/bin/tld ||return 1
  
  # Build tnc
  cd ../tnc
  bmake ||return 1
  install -D -m755 tnc $pkgdir/usr/bin/tnc ||return 1

  # Build tpl
  cd ../tpl
  bmake || return 1
  install -D -m755 tpl $pkgdir/usr/bin/tpl ||return 1

  # Install LICENSE
  cd $srcdir
  install -D -m 644 LICENSE $pkgdir/usr/share/licenses/andfutils-svn/license
}
