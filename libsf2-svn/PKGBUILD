# Maintainer: albertid <aur at uberhax0r dot de>

pkgname=libsf2-svn
pkgver=2014
pkgrel=2
pkgdesc="C++ library for loading SF2 files"
arch=('i686' 'x86_64')
url="http://linuxsampler.org/"
license=('GPL')
depends=('bash')
makedepends=('svn' 'libtool' 'automake>=1.5' 'autoconf')
provides=('libsf2')
source=()
md5sums=()

_svntrunk=https://svn.linuxsampler.org/svn/libsf2/trunk
_svnmod=libsf2


build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf $srcdir/$_svnmod-build
  cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
  cd $srcdir/$_svnmod-build

  #
  # BUILD
  #

  libtoolize -c -f -i || return 1
  aclocal || return 1
  autoconf || return 1
  autoheader || return 1
  automake --add-missing || return 1
  ./configure --prefix=/usr || return 1
  make || return 1
}

package() {
  cd "$srcdir/$_svnmod-build"
  make DESTDIR=$pkgdir install || return 1
}

