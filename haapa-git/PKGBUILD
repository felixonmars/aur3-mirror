_pkgname=haapa
pkgname=haapa-git
pkgver=0.121.fb0d1f8
pkgrel=1
pkgdesc='A simple status program in C'
url='http://github.com/JuhaniImberg/haapa'
license=('MIT')
arch=('i686' 'x86_64')
depends=('libevent')
optdepends=(
  'libmpdclient: mpd support'
  'wireless_tools: wireless support'
  'alsa-lib: alsa support'
  'xorg-server: xsetrootwindowname support'
)
makedepends=('git')
conflicts=('haapa')
provides=('haapa')
source=('git://github.com/JuhaniImberg/haapa')
md5sums=('SKIP')
install=haapa.install

pkgver() {
	cd $_pkgname
	echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
	cd $_pkgname
	make
}

package() {
	cd $_pkgname
	make PREFIX=/usr DESTDIR="$pkgdir" install
	install -m644 -D LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
