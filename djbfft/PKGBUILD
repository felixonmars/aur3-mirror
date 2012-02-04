# Contributor: Andreas Hauser <andy-aur@splashground.de>
pkgname=djbfft
pkgver=0.76
pkgrel=1
pkgdesc="an extremely fast library for Fast Fourier Transformation."
arch=(x86_64)
url="http://cr.yp.to/djbfft.html"
license=('unknown')
provides=(fft)
source=(http://cr.yp.to/djbfft/$pkgname-$pkgver.tar.gz error.h.patch)

build() {
    cd "$startdir/src/$pkgname-$pkgver"
    echo "$startdir/pkg/opt/djbfft" > conf-home
    patch -p0 < ../error.h.patch
    make
    mkdir "$startdir/pkg/opt"
    make DESTDIR=$startdir/pkg setup check
}
md5sums=('9349eff24c1f9fdfb98cfb51bece8efb')
