# Maintainer: Alexej Magura <agm2819*gmail*>
#
#
pkgname=spass-gen
_pkgname=spass
pkgver=3.1
pkgrel=6
pkgdesc="Cryptographically secure random password/passphrase generator"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/spass"
license=('GPL3')
depends=('boost' 'boost-libs' 'qt4')
makedepends=('cmake')
source=("http://sourceforge.net/projects/spass/files/$_pkgname-$pkgver/$_pkgname-${pkgver}.tar.xz/download")
md5sums=('7b8a58e4ebe70952e2a860266c9f4f89')

prepare() {
    cd "$srcdir/$_pkgname-$pkgver"

    ([[ -d "build" ]] && rm -r build && mkdir build) || mkdir build

}

build() {
    cd "$srcdir/$_pkgname-$pkgver/build"

    cmake ../

    make
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/build"

    install -Dm 755 "$_pkgname" "$pkgdir/usr/bin/$pkgname"

    install -Dm 755 "$_pkgname-qt" "$pkgdir/usr/bin/$pkgname-qt"

    cd ../

    install -Dm 644 "COPYING" "$pkgdir/usr/share/doc/$pkgname/COPYING"

    install -Dm 644 "README.rst" "$pkgdir/usr/share/doc/$pkgname/README"

}
