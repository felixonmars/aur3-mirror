# Maintainer: Rafael Beraldo <rafaelluisberaldo@gmail.com>

pkgname=fluxbox-ddate
pkgver=1.1.1_0
pkgrel=1
pkgdesc="A Fluxbox fork with support to the discordian calendar."
arch=('i686' 'x86_64')
url="http://blog.tiagomadeira.com/calendario-santo-discordiano-no-fluxbox"
license=('GPL')
depends=('libxft' 'libxpm' 'libxrandr' 'imlib2' 'libxinerama' 'util-linux-ng')
makedepends=('pkgconfig')
source=(http://blog.tiagomadeira.com/$pkgname-${pkgver/_/-}.tar.bz2)
md5sums=('62692477e3f213a60a0935f826418b0d')
conflicts=('fluxbox')

build() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-${pkgver/_/-}"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
