# Contributor: Luka Perkov <libbruteforce <at> lukaperkov <dOt> net>

pkgname=libbruteforce
pkgver=0.0.1
pkgrel=2
pkgdesc="libbruteforce library calculates variations with repetition and can be used to provide that functionality to cracking applications"
url="http://libbruteforce.lukaperkov.net/"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('gmp')
source=(http://code.lukaperkov.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)

md5sums=('f8390d0199e4123ba13cc644927cc357')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
	./configure --libdir=/usr/lib --includedir=/usr/include || return 1
	make DESTDIR="$pkgdir" || return 1
	make DESTDIR="$pkgdir" check || return 1
	make DESTDIR="$pkgdir" install || return 1
}
