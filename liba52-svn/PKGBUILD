# $Id: PKGBUILD 5600 2008-07-18 22:05:50Z jgc $
# Maintainer: Thomas Baechler <thomas@archlinux.org>
# contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# contributor to svn version: Blissful <narthana.epa@gmail.com>

pkgname=liba52-svn
pkgver=612
pkgrel=4
pkgdesc="liba52 is a free library for decoding ATSC A/52 streams."
arch=('i686' 'x86_64')
license=('GPL2')
depends=('glibc')
provides=('a52dec=0.7.5')
conflicts=('a52dec')
makedepends=('subversion')
options=(!libtool)
source=(bootstrap.diff)
url="http://liba52.sourceforge.net/"
md5sums=('96281ab580644ffc10d2f71182a3e4c3')

_svntrunk=svn://svn.videolan.org/liba52/trunk/
_svnmod=liba52

build() {
  cd ${srcdir}

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf ${srcdir}/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build

  patch -Np1 < ${srcdir}/bootstrap.diff || return 1 #for automake 1.11 support

  ./bootstrap || return 1
  ./configure --prefix=/usr --enable-shared || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1
  rm -rf ${srcdir}/$_svnmod-build
}
