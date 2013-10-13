# Maintainer: archtux <antonio dot arias99999 at gmail dot com>

pkgname=dama
pkgver=0.5.4
pkgrel=1
pkgdesc="Turkish draughts."
arch=('i686' 'x86_64')
url="http://obrecht.fr/dama/"
license=('GPL2')
depends=('gtk')
source=(http://obrecht.fr/dama/dama.$pkgver.tar.gz)
md5sums=('0b0f851d69b6f8b25559ed34e568d2a5')

build() {
  cd $srcdir/dama.$pkgver
  make
}

package() {
  cd $srcdir/dama.$pkgver
  install -Dm755 dama $pkgdir/usr/bin/dama
  install -Dm644 dama.6 $pkgdir/usr/share/man/man6/dama.6
}
