# Maintainer: H.Gökhan Sarı <hsa2@difuzyon.net>
pkgname=pidgin-typewriter-bzr
pkgver=32
pkgrel=1
pkgdesc="Pidgin/libpurple plugin to play typewriter sound when buddies are typing."
arch=('i686')
url="https://launchpad.net/pidgin-typewriter"
license=('GPL')
groups=()
depends=('pidgin')
makedepends=('bzr' 'gnome-common')
md5sums=()

_bzrtrunk="https://launchpad.net/pidgin-typewriter/trunk"
_bzrmod="pidgin-typewriter"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [ -d $_bzrmod ] ; then
    cd ${_bzrmod} && bzr --no-plugins pull ${_bzrtrunk} -r ${pkgver}
    msg "The local files are updated."
  else
    bzr --no-plugins branch ${_bzrtrunk} ${_bzrmod} -q -r ${pkgver}
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
} 
