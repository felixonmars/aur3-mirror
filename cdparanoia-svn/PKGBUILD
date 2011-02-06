# created 19:16:07 - 23/10/09
# Maintainer: Frikilinux <frikilinux at frikilinux.com.ar>

pkgname=cdparanoia-svn
pkgver=15356
pkgrel=1
pkgdesc="Compact Disc Digital Audio extraction tool"
url="http://www.xiph.org/paranoia/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('glibc')
makedepends=('subversion')
conflicts=('cdparanoia' 'cdparanoia-devel')
provides=(cdparanoia=$pkgver)
options=('!makeflags')

_svntrunk='http://svn.xiph.org/trunk/cdparanoia'
_svnmod='cdparanoia'

build() {

  cd $srcdir

  if [ -d $_svnmod/.svn ]; then
      (cd $_svnmod && svn up -r $pkgver)
  else
      svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

      msg "SVN checkout done or server timeout"
      msg "Starting make..."

  if [ -d $srcdir/$_svnmod-build ]; then
      rm -r $srcdir/$_svnmod-build
  fi

      cp -r $srcdir/$_svnmod $srcdir/$_svnmod-build
      cd $srcdir/$_svnmod-build

	./configure --prefix=/usr
	make || return 1
	make prefix=${startdir}/pkg/usr MANDIR="$pkgdir/usr/share/man" install || return 1

}