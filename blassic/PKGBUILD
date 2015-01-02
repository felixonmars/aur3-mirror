# Contributor: eric <eric@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Maintainer : 007 

pkgname=blassic
pkgver=0.10.2
pkgrel=2
pkgdesc="A classic Basic interpreter"
arch=('i686' 'x86_64')
url="http://blassic.org/"
license=('GPL')
depends=('ncurses' 'gcc-libs')
source=(http://blassic.net/bin/${pkgname}-${pkgver}.tgz)
md5sums=('37534abbdbe5bac7b7fc00dbe119df92')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make || return 1
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

