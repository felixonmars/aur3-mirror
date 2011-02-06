# Maintainer: Cyril LEVIS <atlas95@gmail.com>
# Contributor: atlas95 <atlas95@gmail.com> and marc[il]
pkgname=flover
pkgver=9
pkgrel=4
pkgdesc="epiphany extension for download video from youtube or dailymotion"

arch=(i686 x86_64)
url="http://www.codingteam.net/flover-index.html"

provides='epiphany-flover-extension'
depends=('epiphany')
makedepends=('')
source=()
md5sums=()
conflicts=('epiphany-flover-extension')
replaces=('epiphany-flover-extension')
license=('GPL')
_svntrunk=http://svn.codingteam.net/code/flover/trunk
_svnmod=flover

build() {
  cd $startdir/src
  msg "Connecting to SVN server..."
  msg "Checking out $_svnmod"
  svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  cd $_svnmod 
  msg "SVN checkout done or server timeout"
  msg "Starting build..."
  cp -r ../$_svnmod ../$_svnmod-build
  cd ../$_svnmod-build
  install -d -m755 $startdir/pkg/usr/lib/epiphany/2.18/extensions/
  install -m755 flover.py flover.ephy-extension $startdir/pkg/usr/lib/epiphany/2.18/extensions/
  rm -rf $startdir/src/$_svnmod-build
}

