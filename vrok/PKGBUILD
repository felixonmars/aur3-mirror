# Maintainer: hbdee <hbdee.arch@gmail.com>

pkgname=vrok
pkgver=1.0
pkgrel=1
pkgdesc="Lightweight cross platform audio player."
arch=('i686' 'x86_64')
url="http://0xdeafc0de.wordpress.com/vrok/"
license=('GPL')
depends=('qt4')
makedepends=('unzip' 'alsa-lib' 'flac' 'mpg123' 'libogg' 'libvorbis' 'libpulse')
optdepends=("libsamplerate: sample rate converter for alsa")
install='vrok.install'
source=("http://opendesktop.org/CONTENT/content-files/160481-${pkgname}-master.zip"
	'vrok.desktop')
md5sums=('b498c327620b9cdc02f1b67dd64a17bc'
	 '7f34929f21797bde0e2ba76683bea81d')

build() {
  cd ${srcdir}/${pkgname}-master
  # You must specify either 'Alsa' or 'PulseAudio'
  qmake-qt4 CONFIG+=Alsa \
	    CONFIG+=RELEASE
  make
}

package() {
  cd ${srcdir}
  mkdir -p ${pkgdir}/usr/{bin,share/{applications,pixmaps}}
  install -Dm644 ${pkgname}.desktop ${pkgdir}/usr/share/applications/
  cd ${pkgname}-master
  install -Dm644 ${pkgname}.png $pkgdir/usr/share/pixmaps/
  install -Dm755 ${pkgname} ${pkgdir}/usr/bin/
}