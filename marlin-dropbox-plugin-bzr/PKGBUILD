# Maintainer: feuri
# Contributors: ammonkey, Ner0

pkgname=marlin-dropbox-plugin-bzr
pkgver=19
pkgrel=1
pkgdesc="A Dropbox Plugin for Marlin"
arch=('i686' 'x86_64')
url=https://code.launchpad.net/~marlin-devs/marlin-plugin-dropbox/
license=('GPL3')
depends=('glib2' 'gtk3' 'libgee' 'marlin-bzr')
makedepends=('bzr' 'vala')
options=('!libtool' '!emptydirs')

_bzrmod=0.9
_bzrtrunk=https://code.launchpad.net/~marlin-devs/marlin-plugin-dropbox/$_bzrmod

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    #cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" 
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk"
    msg "The local files are updated."
  else
    bzr --no-plugins branch "$_bzrtrunk" "$_bzrmod" -q
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  cmake ../$_bzrmod -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
