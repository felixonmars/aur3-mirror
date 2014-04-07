# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=japa
pkgver=0.8.4
pkgrel=1
pkgdesc="JACK and ALSA Perceptual Analyser."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('clthreads' 'clxclient' 'fftw' 'jack' 'zita-alsa-pcmi')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('966a8774e5b232bf055922dfdcc1b730')

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/"
}

package(){
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir/" install

  # doc
  install -Dm644 ../README \
    "$pkgdir/usr/share/doc/$pkgname/README"
}