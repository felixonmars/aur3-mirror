# Contributor: Luka Perkov <recat <at> lukaperkov <dOt> net>

pkgname=recat
pkgver=0.1
pkgrel=1
pkgdesc="recat - calculate variations with repetition and print on the standard output"
url="http://recat.lukaperkov.net/"
license=('GPLv3')
arch=('i686' 'x86_64')
depends=('libbruteforce' 'gmp')
source=(http://code.lukaperkov.net/${pkgname}/${pkgname}-${pkgver}.tar.gz)

md5sums=('050115c23312241991751aaf02c52929')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}" || return 1
	./configure --prefix=/usr || return 1
	make DESTDIR="$pkgdir" || return 1
	make DESTDIR="$pkgdir" check || return 1
	make DESTDIR="$pkgdir" install || return 1
}
