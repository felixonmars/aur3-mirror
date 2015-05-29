# Maintainer: Rikard Falkeborn <rikard.falkeborn@gmail.com>
# Contributor: Nathanael Schaeffer

pkgname=nfft
pkgver=3.3.0
pkgrel=1
pkgdesc="Software library for computing nonequispaced fast Fourier and related transformations (including Fast Spherical Harmonic Transform)"
arch=('i686' 'x86_64')
url="http://www-user.tu-chemnitz.de/~potts/nfft/index.php"
license=('GPL')
depends=('fftw')
source=("https://github.com/NFFT/nfft/archive/$pkgver.tar.gz")
md5sums=('f610224026fdf887bebaac17c46a1466')
options=(!libtool)

build() {
    cd "$srcdir/$pkgname-$pkgver"
	./bootstrap.sh
    ./configure --prefix=/usr --enable-all
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make prefix="$pkgdir/usr" install
}
