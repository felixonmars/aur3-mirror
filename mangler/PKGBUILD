# Maintainer: Simon Perry <pezz at sanxion dot net>
# Contributor: Sigitas Mazaliauskas <sigisnn at gmail dot com>
# Contributor: LinkMaster03 <linkmaster032000 the at symbol gmail.com>

pkgname=mangler
pkgver=1.2.5
pkgrel=1
pkgdesc="Ventrilo compatible VOIP client for Linux"
arch=('i686' 'x86_64')
url="http://www.mangler.org/"
license=('GPL3')
depends=('dbus-glib' 'gtkmm' 'gsm' 'libpulse' 'speex')
makedepends=('pkg-config' 'librsvg')
optdepends=('alsa-lib: ALSA support'
  'oss: OSS support'
  'celt: CELT codec support'
  'espeak: TTS support'
  'xosd: Information overlay support'
  'g15daemon: G15 keyboard support'
  'libg15: G15 keyboard support'
  'libg15render: G15 keyboard support')
conflicts=('mangler-git' 'mangler-svn' 'mangler-snapshot')
source=(http://www.mangler.org/downloads/$pkgname-$pkgver.tar.bz2)
sha256sums=('baae921ac7d0708bf1f435977fa834e41e66007532a39009154835bc4677a55f')
options=(!libtool)

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
  make DESTDIR=${pkgdir} install
}
