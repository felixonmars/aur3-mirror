# Contributer: Lava Croft <lava.croft@trioptimum.com>
# Co-authors: Xilon, opqdonut, wizzomafizzo and tomkx - many, many thanks for your patience

pkgname=stratagus-svn
provides=stratagus
pkgver=20070306
pkgrel=1
pkgdesc="Stratagus is a free cross-platform real-time strategy gaming engine. This will get you the bleeding edge SVN version."
arch=(i686)
url="http://stratagus.sourceforge.net/"
license="GPL"
depends=('bzip2' 'sdl' 'libpng' 'libvorbis' 'libmikmod' 'lua')
makedepends=('subversion')
conflicts=('stratagus')
provides=('stratagus')
source=()
md5sums=()

_svntrunk=https://stratagus.svn.sourceforge.net/svnroot/stratagus/stratagus/trunk
_svnmod=stratagus

build() {
  cd $startdir/src

  yes "t" | svn co $_svntrunk --config-dir ./ -r \{$pkgver\} $_svnmod || return 1
  
  msg "SVN checkout done or server timeout"
  msg "Starting make..."
  rm -rf $startdir/src/$_svnmod-build
  cp -r $_svnmod $_svnmod-build
  cd $_svnmod-build
  ./autogen.sh
  ./configure --prefix=/usr  
  
  make || return 1

  install -D -m 755 stratagus $startdir/pkg/usr/bin/stratagus

} 
