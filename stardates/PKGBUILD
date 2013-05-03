# Maintainer: Alexej Magura <agm2819*gmail*>
# Contributor: Douglas Thrift <douglas@douglasthrift.net>

pkgname=stardates
_pkgname=stardate
pkgver=1.6.1
pkgrel=4
pkgdesc="Displays date in 5 formats (including stardate of course)"
arch=('i686' 'x86_64')
url="ftp://ftp.cc.umanitoba.ca/startrek/stardates-pgms/"
license=('BSD')
depends=('glibc')
install=stardates.install
source=("ftp://ftp.cc.umanitoba.ca/startrek/stardates-pgms/$pkgname-${pkgver}.tar.gz" "Makefile" "License.patchfile")
md5sums=('266e8671fdea2048f7d99f0e5338d156'

	 '8fb35f9288f4e2fa5433681a39e32ea1'
	 
	 'a1e00d5002dd56280b680deb72f28fbf')

prepare() {
    mv "$srcdir/Makefile" "$srcdir/$pkgname-$pkgver/Makefile"
    cd "$srcdir/$pkgname-$pkgver"
    if [[ -f "$srcdir/$pkgname-$pkgver/COPYRIGHT" ]]; then
	rm "$srcdir/$pkgname-$pkgver/COPYRIGHT"
    fi
    patch "COPYRIGHT" "$srcdir/License.patchfile"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make all

}

package () {
    cd "$srcdir/$pkgname-$pkgver"
    
    make DESTDIR=$pkgdir PKGNAME=$pkgname install

   # install -m 644 -D "README" "$pkgdir/usr/share/doc/$pkgname/README"
   # install -m 644 -D "${_pkgname}.1" "$pkgdir/usr/share/man/man1/${_pkgname}"
   # install -m 755 -D "${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
   # install -m 644 -D "COPYRIGHT" "$pkgdir/usr/share/licenses/${pkgname}/COPYRIGHT"
    
    make clean
}
