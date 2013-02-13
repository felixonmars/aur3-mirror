pkgname=sim-im-git
pkgver=20130213
pkgrel=1
pkgdesc="sim instant messenger"
arch=(i686 x86_64)
url="http://sim-im.org"
license=('GPL')
depends=(qt libxslt gcc-libs)
makedepends=('git')

_gitroot=https://bitbucket.org/todin/sim-im.git
_gitname=sim-im

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

  #
  # BUILD HERE
  #
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make
}

package() {
  cd "$srcdir/$_gitname-build"
  cp sim/extra/sim.desktop sim/
  make DESTDIR="$pkgdir/" install
}
