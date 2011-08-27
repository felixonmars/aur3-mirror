# Maintainer:

pkgname=gnome-do-plugins-bzr
_realname=gnome-do-plugins
pkgver=715
pkgrel=1
pkgdesc="Plugins for GNOME Do"
arch=('i686' 'x86_64')
url="https://launchpad.net/~do-plugins"
license=('GPL3')
depends=('gnome-do-bzr')
makedepends=('bzr' 'intltool' 'monodevelop')
optdepends=('banshee: Banshee plugin'
            'evolution-sharp: Evolution plugin'
            'flickrnet: Flickr plugin')
provides=($_realname)
conflicts=($_realname)
options=('!makeflags')
source=()
md5sums=()

_bzrtrunk="lp:do-plugins"
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
