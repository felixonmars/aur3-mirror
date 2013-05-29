# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Philipp Uberbacher <murks at lavabit dot com>

pkgname=jnoise  
pkgver=0.6.0
pkgrel=1 
pkgdesc="A command line JACK app generating white and pink gaussian noise"
url="http://kokkinizita.linuxaudio.org/linuxaudio/index.html"
arch=('i686' 'x86_64')
license=('GPL')
depends=('jack')
source=("http://kokkinizita.linuxaudio.org/linuxaudio/downloads/$pkgname-$pkgver.tar.bz2")
md5sums=('9f864ea423c66a6efb92e57665431a11')

build() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/source"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
}
