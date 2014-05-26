# Maintainer: Hilton Medeiros <medeiros.hilton@gmail.com>
pkgname=cainteoir-engine-git
_gitname=cainteoir-engine
pkgver=0.12.2.r342.g832dc40
pkgrel=1
pkgdesc="A library that provides text-to-speech functionality for reading and recording different document formats."
arch=('i686' 'x86_64')
url="https://github.com/rhdunn/cainteoir-engine"
license=('GPL3')
makedepends=('git')
depends=('libsigc++' 'shared-mime-info' 'python2-yaml')
optdepends=('libpulse:      for PulseAudio output support'
            'alsa-utils:    for ALSA audio output support'
            'libvorbis:     for Ogg Vorbis support'
            'espeak:        for eSpeak support'
            'svox-pico-git: for SVOX Pico support'
            'poppler:       for PDF support'
            'ffmpeg:        for EPUB 3.0 Media Overlay support')
provides=('cainteoir-engine')
conflicts=('cainteoir-engine')
source=("git+https://github.com/rhdunn/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long | sed -r 's/^cainteoir-engine-//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/$_gitname
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir/" install
  rm -fr "$pkgdir/usr/share/mime"
} 

