# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Daenyth <Daenyth+Arch@gmail.com>

pkgname=gnushogi
pkgver=1.4.2
pkgrel=2
pkgdesc="A program that plays shogi (Japanese chess)"
arch=(i686 x86_64)
url=http://www.cs.caltech.edu/~mvanier/hacking/$pkgname/$pkgname.html
license=(GPL2)
optdepends=('xshogi: X-based version')
source=(ftp://ftp.gnu.org/gnu/$pkgname/$pkgname-$pkgver.tar.gz)
sha256sums=('1ecc48a866303c63652552b325d685e7ef5e9893244080291a61d96505d52b29')
sha512sums=('02e6f05b5e9cc665d595196a6c912fef9f3488c9743aff433cb4b4afaa2c9fc051ee9ed73517e116890c1fd549c362101bd269f2a1a56c758f37cce8b816c53e')

prepare() {
    sed -i -e 's:/man/man6\|/info:/share&:g' -e 's:-ltermcap::g' $pkgname-$pkgver/$pkgname/Makefile.in
}

build() {
    cd $pkgname-$pkgver/
    ./configure --prefix=/usr --with-xshogi
    make
    make -C $pkgname $pkgname
}

package() {
    make -C $pkgname-$pkgver DESTDIR="$pkgdir" prefix="$pkgdir/usr" install
}
