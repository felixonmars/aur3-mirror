# Maintainer : pavolsk <pavol.kapusta at gmail dot com>
# Package is based on AUR stk11xx package, so I list all here all contributors to the original package:
# Contributor : jSparber <julian at sparber dot net>
# Contributor : SpepS <dreamspepser at yahoo dot it>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>

_kv=`uname -r | sed "s/\([0-9]\+.[0-9]\+\).*/\1/"` # kernel version
pkgname=stk11xx-svn
pkgver=107
pkgrel=3
pkgdesc="Syntek DC-1125 Camera Driver (integrated camera in Asus laptops)"
arch=(i686 x86_64)
url="http://syntekdriver.sourceforge.net"
license=('GPL')
depends=("linux")
makedepends=('subversion' 'ctags' 'linux-headers')
install="$pkgname.install"
provides=('stk11xx')
replaces=('stk11xx')
source=("stk11xx_kernel11.patch" "stk11xx_sysfs.patch" "$pkgname.install");
md5sums=('86123174ff309ce646d0060cb2d19ddb'
	 'a655b8df03ad18053645cf8a33c5b625'
         'd1ebdbe36756f49fcfabfcd8498b3512')
	 
_svntrunk="https://syntekdriver.svn.sourceforge.net/svnroot/syntekdriver/trunk/driver"
_svnmod="driver"

build() {
  cd "$srcdir"
  msg "Connecting to SVN server...."

  if [[ -d "$_svnmod/.svn" ]]; then
    (cd "$_svnmod" && svn up -r "$pkgver")
  else
    svn co "$_svntrunk" --config-dir ./ -r "$pkgver" "$_svnmod"
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_svnmod-build"
  svn export "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"
	patch -p1 -i $srcdir/stk11xx_kernel11.patch
	patch -p1 -i $srcdir/stk11xx_sysfs.patch
  #
  # BUILD HERE
  #
 
  make -f Makefile.standalone
}

package() {
  cd "$srcdir/$_svnmod-build"

  # module
  install -Dm644 stk11xx.ko \
    "$pkgdir/usr/lib/modules/extramodules-$_kv-ARCH/stk11xx.ko"

  # readme
  install -Dm644 README "$pkgdir/usr/share/stk11xx/README"
} 

