# Contributor: Jochen Immendörfer <jochen dot immendoerfer at gmail dot com>
pkgname=freewheeling
pkgver=0.6
pkgrel=1
pkgdesc="Freewheeling is a new way to be In The Muse-ical Moment.  It's a live looping instrument that returns us to the joy of making music spontaneously."
url="http://freewheeling.sourceforge.net/"
depends=('libxml2' 'sdl_ttf' 'fluidsynth' 'sdl_gfx' 'libvorbis' 'gnutls' 'libsm')
source=(http://downloads.sourceforge.net/sourceforge/freewheeling/fweelin-$pkgver-src.tar.bz2)
md5sums=('7985dfaffabbeec2bcfe91a4956ac0b8')
arch=('i686')
license=('GPL')


build() {
  cd $startdir/src/fweelin-${pkgver:0:5}
  ./configure --prefix=/usr
  make || return 1
  make DESTDIR=$startdir/pkg install
}
