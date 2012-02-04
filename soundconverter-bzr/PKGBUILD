# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=soundconverter-bzr
pkgver=292
pkgrel=1
pkgdesc="A simple sound converter application for GNOME - bzr from launchpad"
arch=('i686' 'x86_64')
url="https://code.launchpad.net/~vcs-imports/soundconverter/trunk"
license=('GPL3')
depends=('gnome-python' 'gstreamer0.10-python' 
  'hicolor-icon-theme' 'gstreamer0.10-ugly-plugins' 
  'gstreamer0.10-good-plugins')
makedepends=('bzr' 'perlxml' 'intltool')
provides=('soundconverter')
conflicts=('soundconverter')
install=soundconverter.install
source=()
md5sums=()

_bzrtrunk=lp:soundconverter
_bzrmod="soundconverter"

build() {
  cd "$srcdir"
  msg "Connecting to Bazaar server..."
  if [[ -d $_bzrmod/.bzr ]]; then
    (cd $_bzrmod && bzr update -v && cd ..)
    msg "Local checkout updated or server timeout"
  else
    bzr co --lightweight -v $_bzrtrunk $_bzrmod
    msg "Checkout done or server timeout"
  fi
  
  msg "Bazaar checkout done or server timeout"
  msg "Starting make..."

  [ -d "$srcdir/$_bzrmod-build" ] && rm -rf "$srcdir/$_bzrmod-build"
  cp -r "$srcdir/$_bzrmod" "$srcdir/$_bzrmod-build"
  cd "$srcdir/${_bzrmod}-build"

  #
  # BUILD HERE
  #
#  patch < $srcdir/configure.in.patch
  PYTHON=python2 ./autogen.sh
  PYTHON=python2 ./configure --prefix=/usr
  make

  for _i in soundconverter/*.py bin/soundconverter.py bin/soundconverter
  do
    sed -i '1s+python+python2+' $_i
  done
}

package() {
  cd "$srcdir/$_bzrmod-build"
  make DESTDIR="$pkgdir/" install
}
