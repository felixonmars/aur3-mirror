# Contributor: Luiz Ribeiro <luizribeiro@gmail.com>
# Contributor: Federico Quagliata <ntp@quaqo.org>

pkgname=effectv
pkgver=0.3.11
pkgrel=2
pkgdesc="EffecTV is a real-time video effector. You can watch TV or video through amazing effectors."
url="http://effectv.sourceforge.net/"
depends=('sdl')
makedepends=('nasm')
arch=(i686)
license=('GPL')
source=(http://downloads.sourceforge.net/effectv/effectv-$pkgver.tar.gz \
timedist.patch trunc_collision.patch)
md5sums=('71570b71009df0f1ff53e31de6f50cee' \
'0e9a749ecd890fa733fb668359f4d272' '252c36ed4140620995e2dada5a727152')
build() {
	cd $startdir/src/$pkgname-$pkgver
	# Trunc name collision patch
	patch -Np0 < $startdir/src/trunc_collision.patch || return 1
	# Upstream patch
	patch -Np0 < $startdir/src/timedist.patch || return 1
	sed -ie 's_/usr/local_/usr_g' config.mk
	make || return 1
	mkdir -p $startdir/pkg/usr/bin
	mkdir -p $startdir/pkg/usr/man/man1
	make install INSTALL=/bin/install\ -c DESTDIR=$startdir/pkg || return 1
}
