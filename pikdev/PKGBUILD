# Contributor: Petteri Aimonen <jpa@aur.mail.kapsi.fi>
# Maintainer: Kevin Cox <youarefunny - ktcox@rogers.com>
pkgname=pikdev
pkgver=1.2.1
pkgrel=2
pkgdesc="PIC Development IDE for KDE"
license=('GPL')
url="http://pikdev.free.fr/"
depends=('kdelibs3' 'automake' 'hicolor-icon-theme')
optdepends=('gputils:	Compile and link'
            'pk2cmd:	Upload via PikKit2 programer'
            'cpik:	C compiler')
arch=('i686' 'x86_64')
install=$pkgname.install
source=("http://pikdev.free.fr/$pkgname-$pkgver.tar.gz"
        'binlocations.patch')
md5sums=('12de13c004b4571366762580b67767ab'
         '21f4e5184b488fcbe65e0a14f3a94690')

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	patch ${srcdir}/${pkgname}-${pkgver}/Makefile.in ../binlocations.patch	#	Tell make where our binaries are
	./configure --with-qt-dir=/opt/qt --prefix=/opt/kde --without-arts --disable-rpath
	
	export KDEDIRS=${pkgdir}/usr:/opt/kde
	# rpath removal
	sed -i 's|^hardcode_libdir_flag_spec=.*|hardcode_libdir_flag_spec=""|g' libtool
	sed -i 's|^runpath_var=LD_RUN_PATH|runpath_var=DIE_RPATH_DIE|g' libtool
	
	make
	make prefix="${pkgdir}/usr" install
}
