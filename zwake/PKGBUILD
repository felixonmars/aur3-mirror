# Contributor: Luka Perkov <zwake <at> lukaperkov <dOt> net>

pkgname=zwake
pkgver=0.1.0
pkgrel=1
pkgdesc="zwake is rewrite of Asleap tool and uses libbruteforce library."
url="http://lukaperkov.net/"
license=('GPL')
arch=('i686' 'x86_64')
makedepends=('libbruteforce')
source=(http://code.lukaperkov.net/${pkgname}-${pkgver}.tar.gz)

md5sums=('c3c0ca7f835ac82cbcd901f797c055d0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
  ./configure --prefix=/usr CFLAGS='-03'|| return 1
  make DESTDIR="$pkgdir" || return 1
  make DESTDIR="$pkgdir" check || return 1
  make DESTDIR="$pkgdir" install || return 1
}

