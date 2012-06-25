# Maintainer: Simon Perry <pezz [at] sanxion [dot] net>
# Contributor: Vítor Ferreira <vitor [dot] dominor [at] gmail [dot] com>

pkgname=mangler-git
pkgver=20120625
pkgrel=1
pkgdesc="A Ventrilo compatible VOIP client for Linux (unofficial source)"
arch=('i686' 'x86_64')
url="https://github.com/haxar/mangler"
license=('GPL3')
depends=('gtkmm' 'gsm' 'libpulse' 'dbus-glib' 'speex')
makedepends=('git' 'librsvg')
optdepends=('alsa-lib: ALSA support'
  'oss: OSS support'
  'celt: CELT codec support'
  'espeak: TTS support'
  'xosd: Information overlay support'
  'g15daemon: G15 keyboard support'
  'libg15: G15 keyboard support'
  'libg15render: G15 keyboard support')
provides=('mangler')
conflicts=('mangler')
options=(!libtool)
     
_gittrunk=https://github.com/haxar/mangler.git
_gitmod=mangler
     
build() {
  if [ -d $_gitmod/.git ]
  then
    (cd $_gitmod && git pull)
  else
    git clone $_gittrunk $_gitmod
  fi
     
  msg "GIT clone done or server timeout."
  msg "Starting build..."
     
  rm -rf "$srcdir/$_gitmod-build"
  git clone "$srcdir/$_gitmod" "$srcdir/$_gitmod-build"
  cd $_gitmod-build
   
  ./configure --prefix=/usr --enable-static=no
  make
}
     
package() {
  cd "$srcdir/$_gitmod-build"
  make DESTDIR="$pkgdir/" install
}

