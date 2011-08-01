# Maintainer: SpepS <dreamspepser at yahoo dot it>

pkgname=machina-svn
pkgver=3429
pkgrel=1
pkgdesc="A polyphonic MIDI sequencer based on Finite State Automata"
arch=(i686 x86_64)
url="http://drobilla.net/software/machina/"
license=('GPL')
depends=('flowcanvas>=1.0.0' 'jack' 'libglademm' 'raul>=0.8.1' 'sord')
makedepends=('python2' 'subversion')
install="$pkgname.install"
provides=('machina')
conflicts=('machina')

_svntrunk=http://svn.drobilla.net/lad/trunk/machina
_svnmod=machina

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  #
  # BUILD
  #

  # remove ldconfig
  sed -i "/ldconfig/d" src/{engine,client}/wscript

  python2 waf configure --prefix=/usr
  python2 waf
}

package() {

  cd "$srcdir/$_svnmod-build"

  DESTDIR="$pkgdir/" python2 waf install

  # icon and desktop file
  install -Dm644 src/gui/machina.svg "$pkgdir/usr/share/pixmaps/machina.svg"
  install -Dm644 machina.desktop.in "$pkgdir/usr/share/applications/machina.desktop"
}
