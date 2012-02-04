# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# Maintainer: corvolino <corvolino@archlinux.com.br>

pkgname=pidgin-fserv
pkgver=0.0.1
pkgrel=3
pkgdesc="Fserv plugin for Pidgin"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/fserv4pidgin/"
license=('GPL2')
depends=('glibc' 'pidgin')
source=(http://downloads.sourceforge.net/fserv4pidgin/fserv4pidgin-0.0.1/fserv-$pkgver.tar.bz2)
md5sums=('a0be2abd6068f8d906cdf787e84b57b7') 

build() {
  cd "$srcdir/fserv-$pkgver"

  make
}

package() {
  cd "$srcdir/fserv-$pkgver"

  make DESTDIR="$pkgdir/" install
}



