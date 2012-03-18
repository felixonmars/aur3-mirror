# Contributor: Peter Feuerer <peter@piie.net>

pkgname=foosearch
pkgver=0.1
pkgrel=1
pkgdesc="Simple file search dialog using gtk2 and regular expressions, especialy for beeing used with pcmanfm"
arch=('i686' 'x86_64')
url="http://piie.net/files/"
license=('GPL')
groups=('lxde')
depends=('gtk2')
makedepends=('intltool' 'pkgconfig')
source=(${url}/${pkgname}-$pkgver.tar.gz)
md5sums=('6d2c90150a9d4b008dc596d30016aa98')


build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make DESTDIR="$pkgdir" install
}

