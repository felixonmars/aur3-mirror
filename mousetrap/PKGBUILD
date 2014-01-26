# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=mousetrap
pkgver=1.0c
pkgrel=1
pkgdesc="A challenging old-style puzzle game, involving you collecting fruit and avoiding the enemy red dots"
arch=('i686' 'x86_64')
url="http://www.steve.org.uk/Software/mousetrap/"
license=('GPL')
depends=('sdl_gfx' 'sdl_mixer')
source=("http://www.steve.org.uk/Software/mousetrap/mousetrap-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/mousetrap-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/mousetrap-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

md5sums=('c40fffdcfc9085cad3c77c16fe3d74e6')
