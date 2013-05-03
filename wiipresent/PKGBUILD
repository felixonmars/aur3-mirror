# Maintainer: Chirantan Ekbote <chirantan.ekbote at gmail.com>
# Contributor: G_Syme <demichan(at)mail(dot)upb(dot)de>

pkgname=wiipresent
pkgver=0.7.5.2
pkgrel=1
pkgdesc="Tools for using presentation programs with a Wiimote."
arch=('i686' 'x86_64')
url="http://dag.wieers.com/home-made/wiipresent/"
license=('GPL')
depends=('libwiimote')
changelog=CHANGELOG
source=("http://dag.wieers.com/home-made/wiipresent/$pkgname-$pkgver.tar.bz2")
md5sums=('fbabcab8eeeedfbdd72079cb806be0e3')

build() {
    make -C "$srcdir/$pkgname-$pkgver"
}

package() {
    make DESTDIR="$pkgdir" -C "$srcdir/$pkgname-$pkgver" install
}
