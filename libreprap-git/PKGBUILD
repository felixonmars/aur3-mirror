# Contributor:	Thomas Mudrunka <harvie@@email..cz>
# Maintainer: 	Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=libreprap-git
pkgver=20110504
pkgrel=1
pkgdesc="Cross-platform cross-machine RepRap (SLA, stereolithography, 3D printing) communications library"
arch=('x86_64' 'i686')
url="https://github.com/Ralith/libreprap"
license=('GPL')
depends=()
provides=(libreprap)
makedepends=(git cmake)
source=()
md5sums=()

_gitroot='git://github.com/Ralith/libreprap.git'
_gitname="$pkgname"

build() {
  cd ${srcdir}/

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg "The local files are updated."
  else
    git clone --depth 1 $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  cp -r "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"

  #
  # BUILD HERE
  #

	cmake -G 'Unix Makefiles' -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" || return 1
	make || return 1
	make install PREFIX="$pkgdir/usr" || return 1
}
