# Contributor: Feng Wang <wanng.fenng@gmail.com>

pkgname=unuran
pkgver=1.8.0
pkgrel=1
pkgdesc="a collection of algorithms for generating non-uniform pseudorandom variates"
arch=('i686' 'x86_64')
url=('http://statmath.wu.ac.at/unuran/index.html')
license=('GPL')
makedepends=('gcc')
source=('http://statmath.wu.ac.at/unuran/unuran-1.8.0.tar.gz')
md5sums=('2982f34117e83d58b728dabe19e68b22')

build() {
  cd "$srcdir"/${pkgname}-${pkgver}

  ./configure --prefix=/usr --enable-shared  

  make || return 1

  make DESTDIR="$pkgdir" install || return 1
}

