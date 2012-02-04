# Contributor: Alex Ignatov <lexszero@gmail.com>
pkgname=stm32flash-svn
pkgver=61
pkgrel=2
pkgdesc="Open source flash program for the STM32 ARM processors using the ST bootloader."
arch=('i686' 'x86_64')
url="http://code.google.com/p/stm32flash/"
license=('GPLv3')
makedepends=('subversion')

_svntrunk=http://stm32flash.googlecode.com/svn/trunk/
_svnmod=stm32flash

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

  make
}

package() {
  cd "$srcdir/$_svnmod-build/"
  install -m 755 -d $pkgdir/usr/bin
  install -m 755 stm32flash $pkgdir/usr/bin/stm32flash
}
