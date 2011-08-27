pkgname=rhythmbox-shoutcast
pkgver=1.6.1
pkgrel=1
pkgdesc="A shoutcast plugin that just works on rhythmbox"
arch=('i686' 'x86_64')
url="http://code.google.com/p/rhythmbox-shoutcast"
depends=('python' 'rhythmbox')
makedepends=()
license=('GPLv3')
conflicts=('rhythmbox-radio-browser-git' 'rhythmbox-radio-browser-git')
source=( http://rhythmbox-shoutcast.googlecode.com/files/$pkgname-$pkgver.tgz)
md5sums=('fcdc2f31ea86e5ccf92958c8a5dcf743')
build() {
	cd "$pkgname-$pkgver"
	sh setup.sh
}
