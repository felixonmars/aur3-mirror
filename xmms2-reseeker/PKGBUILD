# Maintainer: XZS <d dot f dot fischer at web dot de>
pkgname=xmms2-reseeker
pkgver=2
pkgrel=1
pkgdesc="A tiny xmms2 client that skips back a few seconds every time a song resumes from pause."
arch=('i686' 'x86_64')
url="https://github.com/dffischer/xmms2-reseeker"
license=('GPLv3')
depends=('xmms2')
makedepends=('waf')
install=xmms2-reseeker.install
source=("git://github.com/dffischer/xmms2-reseeker.git")
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	waf --prefix=/usr configure build
}

package() {
	cd "$srcdir/$pkgname"
	waf install --destdir="$pkgdir/"
}
