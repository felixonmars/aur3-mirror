# Contributor: Benjamin Bukowski <crankidiot@gmail.com>
pkgname=tcctool-svn
_realname=tcctool
pkgver=28551
pkgrel=1
pkgdesc="A Rockbox utility for uploading code to Telechips TCC77x based devices in USB boot mode"
arch=('i686' 'x86_64')
url="http://www.rockbox.org/"
license=('GPL2')
depends=('libusb')
makedepends=('subversion')

_svntrunk=svn://svn.rockbox.org/rockbox/trunk/utils/${_realname}
_svnmod=tcctool

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

  VERSION=SVN-r${pkgver}  make || return 1
  
  install -Dm755 tcctool $pkgdir/usr/bin/tcctool
}
