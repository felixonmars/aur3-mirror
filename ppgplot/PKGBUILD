# Contributor: Steven Janssens <steve.janssens@gmail.com>

pkgname=ppgplot
pkgver=1.1
pkgrel=1
pkgdesc="Python binding for PGPLOT"
arch=('x86_64')
url="http://www.astro.rug.nl/~breddels/python/ppgplot/"
license=('unknown')
depends=('pgplot' 'python-numeric')
source=(http://www.astro.rug.nl/~breddels/python/ppgplot/$pkgname-$pkgver.tar.gz)
md5sums=('12b8bce17d55e4a34d87ac0330ff9020')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	#replace g2c with gfortran in setup.py
	sed -i 's/g2c/gfortran/' setup.py
	
	./setup.py install --prefix=$startdir/pkg/usr
}

