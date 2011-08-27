# Contributor: Anton Lobov <ahmad200512@yandex.ru>

pkgname=syncefs
pkgver=0.7
pkgrel=1
pkgdesc="SynCE filesystem based on SynCE and Coda"
arch=(i686 x86_64)
license=('GPL')
url="http://www.lvivier.info/SynceFS/"
depends=(synce-libsynce synce-rra docbook2x)
install=${pkgname}.install

source=(http://downloads.sourceforge.net/project/syncefs/syncefs/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz)
#source=(http://download.sourceforge.net/syncefs/${pkgname}-${pkgver}.tar.gz)

md5sums=('68ec11301cb08a62e111632106a76047 ')

build() {

	cd "$srcdir/$pkgname-$pkgver"

	./configure --prefix=/usr
	make || return 1
	make DESTDIR="$pkgdir/" install

}
