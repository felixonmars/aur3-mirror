# Maintainer: aky <aky at archlinux dot ro>

pkgname=zapping
pkgver=0.10cvs6
pkgrel=1
pkgdesc="Zapping, a Gnome TV viewer"
arch=('i686' 'x86_64')
url="http://downloads.sourceforge.net/project/zapping/zapping"
license=('GPL')
depends=('zvbi')
source=($url/$pkgver/zapping-$pkgver.tar.bz2)
md5sums=('6aa7614ac3fd5d39c89c2198598ad27b')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr \
	--infodir=/usr/share/info \
	--mandir=/usr/share/man \
	--sysconfdir=/etc || return 1

        make || return 1
	make DESTDIR="${pkgdir}" install || return 1
}

