# Maintainer: Pier Luigi Fiorini <pierluigi.fiorini@gmail.com>

pkgname=qtaccountsservice
pkgver=0.1.1
pkgrel=1
pkgdesc="Qt-style API for AccountsService"
arch=('i686' 'x86_64')
url="https://github.com/mauios/qtaccountsservice"
license=('LGPL')
depends=('qt5-base' 'qt5-declarative')
makedepends=('cmake' 'qtchooser')
source=(http://sourceforge.net/projects/mauios/files/hawaii/${pkgname}/${pkgname}-${pkgver}.tar.gz)
md5sums=('512a1b3cced05f2d9a73b341f98c4763')


build() {
	cd $pkgname-$pkgver
	cmake . \
		-DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make DESTDIR="${pkgdir}" install
}
