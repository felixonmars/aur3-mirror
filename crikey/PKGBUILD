# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Maintainer: Alexej Magura <agm2819*gmail*>

pkgname=crikey
pkgver=0.8.3
pkgrel=2
pkgdesc="Conveniently Repeated Input Key - simulates key events."
arch=('i686' 'x86_64')
url="http://shallowsky.com/software/crikey"
license=('GPL')
depends=('libxtst')
install=crikey.install
if [[ $pkgver = 0.8.3 ]]; then 
    source=("http://shallowsky.com/software/${pkgname}/${pkgname}-${pkgver}.tar.gz" "http://shallowsky.com/software/${pkgname}/${pkgname}.1")
    md5sums=('e0e791fe9a4a4183ebebf9c38b91c8a2' '33149a7d1448c46d5e3433c9d03dbfb2')
else
    source=("http://shallowsky.com/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
    md5sums=('e0e791fe9a4a4183ebebf9c38b91c8a2')
fi

build() {

	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {

    cd "$srcdir/$pkgname-$pkgver"

    install -m 755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -m 644 -D "TESTING" "$pkgdir/usr/share/doc/$pkgname/TESTING"
    
    cd "$srcdir"

    install -m 644 -D "${pkgname}.1" "$pkgdir/usr/share/man/man1/${pkgname}.1"

}
