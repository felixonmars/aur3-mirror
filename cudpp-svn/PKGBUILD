# Contributor: Jan Stępień <jstepien@users.sourceforge.net>

pkgname=cudpp-svn
pkgver=107
pkgrel=2
pkgdesc="The CUDA Data Parallel Primitives Library"
arch=('i686' 'x86_64')
url="http://gpgpu.org/developer/cudpp"
license=('BSD')
depends=('cuda-toolkit')
makedepends=(subversion)
provides=(cudpp)
conflicts=(cudpp)
source=(nvccflags.patch)
sha1sums=(5b7572b3baececa07299acda2582b1bc7bfd5ad7)

_svntrunk="http://cudpp.googlecode.com/svn/trunk"

build() {
  cd $srcdir
  msg "Connecting to SVN server..."
  if [ -d $pkgname/.svn ]; then
    svn up -r $pkgver
  else
    svn co $_svntrunk -r $pkgver $pkgname
  fi
  msg "SVN checkout done or server timeout"

  cd $srcdir/$pkgname
  patch -Np1 -i $srcdir/nvccflags.patch || return 1
  msg "Done patching, starting make"

  cd $srcdir/$pkgname/common
  make verbose=1 || return 1
  cd $srcdir/$pkgname/cudpp
  make verbose=1 || return 1

  mkdir -p $pkgdir/usr/{lib,include} || return 1
  install -m 644 $srcdir/$pkgname/lib/libcudpp.a $pkgdir/usr/lib
  install -m 644 $srcdir/$pkgname/cudpp/include/cudpp.h $pkgdir/usr/include
}
