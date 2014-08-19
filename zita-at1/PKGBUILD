# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=zita-at1
pkgver=0.4.0
pkgrel=1
pkgdesc="A 'autotuner' Jack application."
arch=('i686' 'x86_64')
url="http://kokkinizita.linuxaudio.org/linuxaudio/"
license=('GPL')
depends=('jack' 'fftw' 'cairo' 'clxclient'
         'zita-resampler' 'clthreads')
source=("${url}downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('4e068b6cd9ceea981f7c9000a568fbe7')

build() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr
}

package() {
  cd $pkgname-$pkgver/source
  make PREFIX=/usr DESTDIR="$pkgdir" install

  # doc
  install -d "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 ../doc/* \
    "$pkgdir/usr/share/doc/$pkgname"
}
