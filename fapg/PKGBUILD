pkgname=fapg
pkgver=0.41
pkgrel=1
pkgdesc="Fast Audio Playlist Generator"
arch=('i686' 'x86_64')
url="http://royale.zerezo.com/fapg"
license=('GPL')
depends=('gawk' 'uriparser' 'grep')
makedepends=('make')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
md5sums=('64be7045dfc0874a831e7d5fb5c435a4')

build() {
	cd ${pkgname}-${pkgver}
	./configure --prefix=/usr
	make
	make DESTDIR="${pkgdir}" install
}
