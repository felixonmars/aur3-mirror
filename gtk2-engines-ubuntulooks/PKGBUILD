# Maintener: Joel Almeida <aullidolunar at gmail dot c0m>

pkgname=gtk2-engines-ubuntulooks
pkgver=0.9.12
pkgrel=1
pkgdesc="Ubuntulooks is a modern-looking engine for GTK+2, based on Clearlooks and used in Ubuntu Linux"
arch=('i686' 'x86_64')
url="https://packages.debian.org/search?keywords=gtk2-engines-ubuntulooks"
license=('GPL')
depends=('gtk2>=2.8.0')
conflicts=('gtk-engine-ubuntulooks')
source=("http://http.us.debian.org/debian/pool/main/u/ubuntulooks/ubuntulooks_${pkgver}.orig.tar.gz")
md5sums=('5ba7d915abe31870103aab5847278d13')


build() {
	cd "$srcdir/ubuntulooks-$pkgver"
	./configure --enable-animation --prefix=/usr
	make
}

package () {
	cd "$srcdir/ubuntulooks-$pkgver"
	make DESTDIR="$pkgdir" install
}
