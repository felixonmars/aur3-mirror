# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: farid abdelnour <farid at atelier-labs.org>
# Maintainer: David Adler <david dot jo dot adler aet gmail dot com>

pkgname=ams-cvs
pkgver=20120430
pkgrel=1
pkgdesc="Alsa Modular Synth, a realtime modular synthesizer and effect processor"
arch=('i686' 'x86_64')
url="http://alsamodular.sourceforge.net/"
license=('GPL')
depends=('qt' 'clalsadrv' 'ladspa' 'fftw' 'jack')
makedepends=('cvs')
provides=('ams')
conflicts=('ams')
install='ams.install'
_cvsroot=":pserver:anonymous@alsamodular.cvs.sourceforge.net:/cvsroot/alsamodular"
_cvsmod="ams"

build() {
  cd "$srcdir"
  msg "Connecting to $_cvsmod.sourceforge.net CVS server...."
  if [ -d $_cvsmod/CVS ]; then
    cd $_cvsmod
    cvs -z3 update -d
  else
    cvs -z3 -d $_cvsroot co -D $pkgver -f $_cvsmod
    cd $_cvsmod
  fi

  msg "CVS checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_cvsmod-build"
  cp -r "$srcdir/$_cvsmod" "$srcdir/$_cvsmod-build"
  cd "$srcdir/$_cvsmod-build"

  #
  # BUILD HERE
  #
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_cvsmod-build"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
