# Maintainer: Denis Tikhomirov <dvtikhomirov@gmail.com>
pkgname=mattext
pkgver=0.3
pkgrel=1
pkgdesc="Simple matix-style pager"
arch=('i686' 'x86_64')
url='https://github.com/dhurum/mattext'
license=('BSD')
depends=('ncurses' 'gcc-libs')
makedepends=('git' 'cmake')
source=( https://github.com/dhurum/${pkgname}/archive/v${pkgver}.tar.gz)
sha256sums=('7463c2cd4151e71ff3f32757dec3f389cc18130f3855dfa340f0a1ce88ab5c5f')

build() {
	cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr ./
  make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
  install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
