pkgname=nvidia-utils-sane

_pacman_get_key()
{
  pacman --print --print-format $1 -S nvidia-utils
}

# Find the newest version in the repository
msg "Checking for original package version"
_src_fullver=$(_pacman_get_key %v)
_src_repo=$(_pacman_get_key %r)
_src_url=$(_pacman_get_key %l)
msg "Original package version: ${_src_fullver} in ${_src_repo}"

pkgver=$(echo $_src_fullver | sed -e 's/\([0-9\.]\+\)-*\(.*\)/\1/')
pkgrel=$(echo $_src_fullver | sed -e 's/\([0-9\.]\+\)-*\(.*\)/\2/')

if false; then
  #Satisfy AUR parser
  pkgver=256.35
  pkgrel=2
fi

pkgdesc="NVIDIA drivers utilities and libraries. Repackaged for compatibility with libgl"
arch=('i686' 'x86_64')
url="http://www.nvidia.com/"
depends=('xorg-server')
optdepends=('gtk2: nvidia-settings' 'pkgconfig: nvidia-xconfig')
conflicts=()
provides=("nvidia-utils=$pkgver")
license=('custom')
install=nvidia.install
source=("${_src_url}")

build() 
{
  cd $srcdir
  msg "Copying files..."
  cp -a etc usr $pkgdir || return 1
  msg "Removing conflicting symlinks..."
  # /usr/lib/libGL.so is missing since 256.*
  # ...but is back by 256.53
  rm $pkgdir/usr/lib/libGL.so $pkgdir/usr/lib/libGL.so.1 $pkgdir/usr/lib/xorg/modules/extensions/libglx.so || return 1
}

md5sums=('683be536928a6600becb8eb6c118d07a')
