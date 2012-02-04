# Maintainer: duca <edumlopes@gmail.com>
# Contributor: Roquette <jmrtt@hotmail.com>

pkgname=lapackpp
pkgver=2.5.4
pkgrel=1
pkgdesc="A library for high performance linear algebra computations. This version includes support for solving linear systems using LU, Cholesky, QR matrix factorizations, and symmetric eigenvalue problems."
url="http://lapackpp.sourceforge.net/"
license=("LGPL")
arch=(i686 x86_64)
source=(http://downloads.sourceforge.net/lapackpp/$pkgname-$pkgver.tar.gz)
md5sums=('9ad74fb73fbcbf378c36a19a5dccbda7')
options=()
depends=('lapack' 'blas')


build() {
    cd $srcdir/$pkgname-$pkgver

         
    ./configure --prefix=/usr 
    make || return 1
    make DESTDIR=$pkgdir install
}

