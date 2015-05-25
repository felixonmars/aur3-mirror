pkgname='close-all-windows'
pkgver=0.0.5
pkgrel=1
pkgdesc="Gracefully close all X11 windows."
arch=('any')
url="https://github.com/vilnius-leopold/close-all-windows"
license=('MIT')
depends=('ruby' 'wmctrl')
conflicts=()
makedepends=()

# hosted source tarball
# source=("$pkgname::https://github.com/vilnius-leopold/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver-source.tar.gz")

# for local development
source=("$pkgname-$pkgver-source.tar.gz")

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
md5sums=('ced6f7529788c8160fd674df938a297b')
