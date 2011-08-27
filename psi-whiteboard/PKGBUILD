# Maintainer: Otakar Haška <ota.haska@seznam.cz>
pkgname=psi-whiteboard
pkgver=0.14
pkgrel=1
pkgdesc="Psi with a whiteboard support"
license=('GPL')
arch=('i686' 'x86_64')
conflicts=('psi')
provides=('psi')
depends=('qca>=2.0' 'aspell' 'libxss' 'qt>=4.4')
url="http://psi-im.org/"
source=("http://downloads.sourceforge.net/psi/psi-${pkgver}.tar.bz2" \
	whiteboard.patch gcc43.patch gcc44.patch \
)
md5sums=('9d7dcce3bcab53b741a712199bd986be'
         '02e8547d076fa7d00a10fce2abd19347'
         'f62b88f0b2e830a03a8f2ece644c60d2'
         'd5bbf88ed0af0594ff50f84f538f46ad')

build() {
	cd $srcdir/psi-${pkgver}
	patch -p0 < ../whiteboard.patch || return 1
	patch -p0 < ../gcc43.patch || return 1
	patch -p0 < ../gcc44.patch || return 1
	./configure --prefix=/usr --disable-bundled-qca || return 1
	make || return 1
	make INSTALL_ROOT=$pkgdir install
}
