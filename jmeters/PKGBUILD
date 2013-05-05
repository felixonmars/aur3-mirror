# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Überbacher <murks at lavabit dot com>

pkgname=jmeters
pkgver=0.4.1
pkgrel=1
pkgdesc="A JACK multichannel audio level meter app with correct ballistics for the VU and the PPM."
url="http://kokkinizita.linuxaudio.org/linuxaudio/downloads/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('clthreads' 'clxclient' 'jack' 'cairo')
source=("$url$pkgname-$pkgver.tar.bz2")
md5sums=('342857a6076a51a37950f47b4c53e60c')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make PREFIX=/usr
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make PREFIX="$pkgdir/usr" install
}
