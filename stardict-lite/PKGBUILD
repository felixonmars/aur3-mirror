# Maintainer: Cravix < dr dot neemous at gmail dot com >
# based on the PKGBUILDs of stardict 3.0.3-2 and 3.0.4-1 plus LDFLAGS patch

pkgname=stardict-lite
pkgver=3.0.4
pkgrel=1
pkgdesc='International dictionary software, light weight version without espeak and gnome support'
arch=('i686' 'x86_64')
url='http://www.stardict.org/'
license=('GPL')
depends=('enchant' 'gtk2' 'libsigc++' 'libsm')
makedepends=('intltool' 'popt' 'gnome-doc-utils' 'gnome-common' 'libmysqlclient')
options=('!libtool' '!emptydirs')
source=("http://stardict-3.googlecode.com/files/stardict-${pkgver}.tar.bz2"
        'gcc46.patch'
        'glib2.patch'
        'zlib.patch')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -p1 -i ../gcc46.patch
	patch -p1 -i ../glib2.patch
	patch -p1 -i ../zlib.patch
	export LDFLAGS="$LDFLAGS -lgmodule-2.0"

	./configure \
		PKG_CONFIG=/usr/bin/pkg-config \
		--prefix=/usr \
		--sysconfdir=/etc \
		--mandir=/usr/share/man \
		--disable-gnome-support \
		--disable-schemas-install \
		--disable-espeak \
		--disable-gucharmap \
		--disable-festival \
		--disable-updateinfo \

	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
md5sums=('0a9abf1936c43a3ee255802c75267f1a'
         '52ff47441c503de07add4b7688510bc5'
         'b2f216897c9053c7e4666c3d78705cf1'
         'ee26dce70fc83b3ce86e5100fede7fad')
