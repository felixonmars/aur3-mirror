# Contributor: pyrho <no@email.net>

pkgname=libxtract
pkgver=0.4.7
pkgrel=1
pkgdesc="Portable, lightweight, simple library for audi feature extraction."
arch=(i686)
url="http://libxtract.sourceforge.net/"
license=('GPL')
groups=()
depends=('automake>=1.6' 'fftw>=3')
makedepends=()
provides=(libxtract)
conflicts=()
replaces=()
backup=()
source=(http://downloads.sourceforge.net/libxtract/$pkgname-$pkgver.tar.gz)
md5sums=('b1dadff5422a3f5b7661bbf2522dd01d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --enable-fft
  make || return 1
  make DESTDIR="$pkgdir/" install
}

