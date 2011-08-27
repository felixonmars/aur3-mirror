# Maintainer:
# Contributor: Dominik Mayer <dominik.mayer {at} web.de>

pkgname=gnome-do-docklets-bzr
_realname=gnome-do-docklets
pkgver=83
pkgrel=3
pkgdesc="Docklets for GNOME Do"
arch=('i686' 'x86_64')
url="https://launchpad.net/~do-plugins"
license=('GPL3')
depends=('gnome-do-bzr')
makedepends=('bzr' 'intltool' 'monodevelop')
provides=($_realname)
conflicts=($_realname)
source=()
md5sums=()

_bzrtrunk="lp:do-plugins/docklets"
_bzrmod=$_realname

build() {
  export MONO_SHARED_DIR="$srcdir/.wabi"
  mkdir -p "$MONO_SHARED_DIR"

  cd "$srcdir"

  msg "Connecting to the server...."

  if [ -d $_bzrmod ]; then
    bzr up $_bzrmod
    msg "The local files are updated."
  else
    bzr co $_bzrtrunk $_bzrmod
  fi

  msg "BZR checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$_bzrmod-build"
  cp -r "$_bzrmod" "$_bzrmod-build"
  cd "$_bzrmod-build"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"

  make DESTDIR="$pkgdir" install

  rm -rf $pkgdir/usr/lib/gnome-do/plugins/*.mdb
}
