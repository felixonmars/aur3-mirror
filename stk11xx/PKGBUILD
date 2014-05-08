# Maintainer : jSparber <julian at sparber dot net>
# Contributor : SpepS <dreamspepser at yahoo dot it>
# Contributor: Marcin Karpezo <sirmacik at gmail dot com>
pkgname=stk11xx
pkgver=20140507
pkgrel=2
pkgdesc="Syntek DC-1125 Camera Driver (integrated camera in Asus laptops)"
arch=(i686 x86_64)
url="http://syntekdriver.sourceforge.net"
license=('GPL')
depends=("linux")
makedepends=('git' 'ctags' 'linux-headers')
install="$pkgname.install"
provides=('stk11xx')
replaces=('stk11xx')
source=("stk11xx_kernel11.patch" "$pkgname.install");

_gitroot="git://git.stuge.se/stk11xx-driver.git"
_gitname="stk11xx-driver"

build() {
  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [[ -d "$_gitname" ]]; then
    cd "$_gitname" && git pull origin
    msg "The local files are updated."
  else
    git clone "$_gitroot" "$_gitname"
  fi
  msg "GIT checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
	patch -p1 -i $srcdir/stk11xx_kernel11.patch
  #
  # BUILD HERE
  #
 
  make -f Makefile.standalone
}

package() {
  cd "$srcdir/$_gitname-build"

  # module
  install -Dm644 stk11xx.ko \
    "$pkgdir/lib/modules/extramodules-$_kv-ARCH/stk11xx.ko"

  # readme
  install -Dm644 README "$pkgdir/usr/share/stk11xx/README"
} 
md5sums=('86123174ff309ce646d0060cb2d19ddb'
         'd1ebdbe36756f49fcfabfcd8498b3512')
