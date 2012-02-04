# Maintainer: SpepS <dreamspepser at yahoo dot it>

_name=harmonyseq
pkgname=$_name-bzr
pkgver=685
pkgrel=1
pkgdesc="A loop-based MIDI software sequencer intended to help music composers and performers."
arch=(i686 x86_64)
url="http://harmonyseq.wordpress.com/"
license=('GPL')
depends=('alsa-lib' 'gtkmm' 'liblo' 'hicolor-icon-theme' 'desktop-file-utils')
provides=("$_name")
conflicts=("$_name")
install="$pkgname.install"

_bzrtrunk=lp:$_name
_bzrmod=$_name

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server...."

  if [[ -d "$_bzrmod" ]]; then
    cd "$_bzrmod" && bzr --no-plugins pull "$_bzrtrunk" -r "$pkgver"
    msg "The local files are updated."
  else
    bzr branch "$_bzrtrunk" "$_bzrmod" -q -r "$pkgver"
  fi

  msg "Bazaar checkout done or server timeout"
  msg "Starting build..."

  rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/$_bzrmod-build"

  #
  # BUILD HERE
  #

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_bzrmod-build"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
