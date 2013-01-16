# Maintainer: Laurent Hofer <laurenth at lavabit dot com>

pkgname=xcas-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Xcas Computer Algebra System"
arch=('i686' 'x86_64')
url="http://www-fourier.ujf-grenoble.fr/~parisse/giac.html"
license=('GPL3')
provides=('xcas' 'giac')
conflicts=('xcas')				
depends=('perl' 'gsl' 'libgl' 'mpfr' 'pari23' 'fltk' 'libjpeg6' 'lapack' 'blas' 'libpng12' 'gmp4')
install=${pkgname}.install
if [ "$CARCH" = 'x86_64' ]; then
	_arch='amd64'
else
	_arch='i386'
fi
source=("http://www-fourier.ujf-grenoble.fr/~parisse/debian/binary-${_arch}/giac_${pkgver}-1_${_arch}.deb")
# Frequent fixes
md5sums=("$(wget -qO - http://www-fourier.ujf-grenoble.fr/~parisse/debian/binary-${_arch}/Packages | grep "MD5sum" | head -n 1 | cut -d' ' -f2)")

build() {
	cd "$srcdir"
	tar xvzf data.tar.gz || return 1
}
     
package() {  
	cd "$srcdir"
	mv -v usr $pkgdir || return 1
}
