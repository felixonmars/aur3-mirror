pkgname=tkresolver
pkgver=0.7.0
pkgrel=1
pkgdesc="Move cursor using your mind."
arch=("i686" "x86_64")
url="http://pkl.net/~node/software/tkresolver/"
license="GPL3"
depends=("boost" "gtkmm" "glibmm" "gconfmm" "sdl" "sdl_gfx" "gsl" "gmp" "gnuplot")
optdepends=("curlpp" "libusb")

source=("http://pkl.net/~node/software/${pkgname}-${pkgver}.tar.gz")
md5sums=('afedc2d61341df8e49d56a7158cdf8a7')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
    make || return 1
	make DESTDIR="$pkgdir" install || return 1
}
