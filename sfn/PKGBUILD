# Maintainer: m1kc <m1kc@yandex.ru>
# Author: m1kc <m1kc@yandex.ru>

pkgname=sfn
pkgver=1.15
pkgrel=1
epoch=
pkgdesc="Utility to send files over network using direct TCP connection"
arch=('i686' 'x86_64')
url="https://github.com/m1kc/sfn"
license=('GPL')
groups=()
depends=('glibc')
makedepends=('dmd' 'libphobos' 'gcc')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('sfn.d' 'Makefile' 'sfn.1' 'terminal.c')
noextract=()
md5sums=('95f89611bdbe8c670e42670d66a667be'
         'd248019fc690f68dc979688451ca841a'
         'bf60c24fabb64786cdd7a0fa67fa0936'
         '831d81f22a8e0df8721346d2cd057b64')

build() {
  #  cd "$srcdir/$pkgname-$pkgver"
  #  ./configure --prefix=/usr
  make
}

package() {
  #  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
