pkgname=kdenetwork-krdc-dockmanager
pkgdesc="krdc with fixes for dockmanager"
pkgreal=kdenetwork
pkgver=4.8.3
pkgrel=1
arch=('i686' 'x86_64')
url='http://www.kde.org'
license=('GPL' 'LGPL' 'FDL')
groups=('kde' 'kdenetwork')
conflicts=('kdenetwork-krdc')
depends=('kdebase-runtime' 'libvncserver' 'rdesktop' 'telepathy-qt4')
optdepends=('kdebase-keditbookmarks: to edit bookmarks')
makedepends=('cmake' 'automoc4' 'boost' 'speex' 'ortp' 'libotr' 'ppp'
	'qca-ossl' 'kdebase-workspace' 'kdebase-lib' 'libvncserver' 'libmsn'
    'v4l-utils' 'libidn' 'rdesktop' 'qimageblitz' 'libxdamage' 'libgadu'
    'telepathy-qt4' 'libktorrent' 'libmms' 'mediastreamer')
url="http://kde.org/applications/internet/krdc/"
source=("http://download.kde.org/stable/${pkgver}/src/${pkgreal}-${pkgver}.tar.xz" 'krdc.diff')
sha1sums=('9da87317c6a10243d6fff8c121c04146415f65cd' 'fd28f990d540ba11003429134ad2df5f36c5ddd3')

build() {
    cd "${srcdir}"
	cd ${pkgreal}-${pkgver}
        patch -p1 < ../krdc.diff
	cd -
	rm -fr build
	mkdir build
	cd build
	cmake ../${pkgreal}-${pkgver} \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_SKIP_RPATH=ON \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DMOZPLUGIN_INSTALL_DIR=/usr/lib/mozilla/plugins/ \
        -DWITH_Xmms=OFF \
		-DWITH_LibMeanwhile=OFF
	cd krdc
	make
}

package() {
	cd $srcdir/build/krdc
	make DESTDIR=$pkgdir install
	cd $srcdir/build/doc/krdc
	make DESTDIR=$pkgdir install
}
