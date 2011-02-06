
pkgname=gwyfract
pkgver=0.8
pkgrel=1
pkgdesc="A simple Mandelbrot set outside renderer"
url="http://gwyddion.net/apps/gwyfract.php"
license=("GPL")
arch=('i686')
#arch=('i686' 'x86_64')
depends=('gmp' 'gwyddion')
source=(http://downloads.sourceforge.net/sourceforge/gwyddion/$pkgname-$pkgver.tar.bz2)

md5sums=('5c2fca5749981de29e792e34423857e8')


build() {
  cd "${srcdir}/$pkgname-$pkgver"

  ./configure --prefix=/usr --sysconfdir=/etc \
              --localstatedir=/var || return 1
  make || return 1

  make DESTDIR="${pkgdir}" install || return 1
  
}



