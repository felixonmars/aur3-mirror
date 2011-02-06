# Contributor: Miguel Paolino <mpaolino at gmail address you know the drill>
pkgname=pipo
pkgver=0.3
pkgrel=4
pkgdesc="Quick tool to scan and parse directories recursively and find images based on user-specified criteria"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://freshmeat.net/projects/pipo/"
groups=('pipo')
depends=('gd' 'libjpeg' 'freetype2' 'libpng' 'zlib' 'glibc' 'expat' 'fontconfig')
makedepends=('pkgconfig' 'perlxml' 'libjpeg' 'freetype2' 'libpng' 'zlib' 'glibc' 'expat' 'fontconfig')
source=(http://ufpr.dl.sourceforge.net/sourceforge/pipo/${pkgname}-${pkgver}.tar.gz)


build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr || return 1
	make || return 1
	make DESTDIR=${pkgdir} install || return 1
}
md5sums=('dc069667a887584ec15fc02cb6b71696')
