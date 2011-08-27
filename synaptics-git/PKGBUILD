pkgname=synaptics-git
pkgver=20080327
pkgrel=1
pkgdesc="Xorg Synaptics driver with an LG touchpad patch"
arch=('i686')
url="http://web.telia.com/~u89404340/touchpad/"
license=('GPL')
depends=('git')
makedepends=()
provides=('synaptics')
conflicts=('synaptics')
source=()
md5sums=()

_gitroot="http://web.telia.com/~u89404340/touchpad/synaptics/.git"
_gitname="synaptics"

build() {
  cd $srcdir

  if [ -d $_gitname ]; then
    (cd $_gitname && git-pull origin)
  else
    git clone $_gitroot
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf $_gitname-build
  cp -r $_gitname $_gitname-build
  cd $_gitname-build
  wget http://www.math.chalmers.se/~ossa/linux/lg_tx_synaptics.diff -o lg_synaptics.diff
  patch -p0 < lg_synaptics.diff
  make || return 1
  make DESTDIR=$pkgdir install || return 1
}
