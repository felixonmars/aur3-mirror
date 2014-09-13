# Maintainer: Vivien Maisonneuve <v dot maisonneuve at gmail dot com>
# Category: science
pkgname='coq-flocq'
pkgver='2.4.0'
pkgrel=1
pkgdesc='A floating-point formalization for the Coq system'
arch=('i686' 'x86_64')
url='http://flocq.gforge.inria.fr/'
license=('LGPL3')
provides=("$pkgname=$pkgver")
depends=('coq')
source=("https://gforge.inria.fr/frs/download.php/file/33979/flocq-2.4.0.tar.gz")
md5sums=('36cee0fb33acf8d292d76a28a22062d5')

build() {
    cd "$srcdir/flocq-$pkgver"
    ./configure --prefix=/usr --libdir="$pkgdir$(coqc -where)"/user-contrib/Flocq
    ./remake
}

package() {
    cd "$srcdir/flocq-$pkgver"
    ./remake install
}
