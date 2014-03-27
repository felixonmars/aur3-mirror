# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=oto
pkgver=0.5
pkgrel=1
pkgdesc='Open Type Organizer (oTo) can show you font info and add new name and cmap tables'
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/oto/"
license=('GPL')
depends=('glibc')
source=("http://downloads.sourceforge.net/project/oto/oto/${pkgver}/oto-${pkgver}.tar.gz")

build() {
	cd "${srcdir}/oto-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/oto-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

md5sums=('3ff522f1812b8c5f568e443029c7c420')
