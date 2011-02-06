# Contributor: Stefano GotuX <xgotux@gmail.com>
pkgname=lopster-it
pkgver=1.2.2
pkgrel=5
pkgdesc="Napster Client using the GTK user interface. Italian version."
license=""
depends=('xorg' 'gtk' 'flac>=1.1.2')
provides=('lopster')
conflicts=('lopster')
source=(http://gotux.altervista.org/arch/aur/$pkgname-$pkgver.tar.gz gcc4.patch)
url="http://lopster.sourceforge.net/"
md5sums=('194a4be4236ce9ff7910a9079469fa82' '88bc83a5cc4466efbca1ebfaabef8033')

build() {
	cd $startdir/src/$pkgname-$pkgver
	# Patch for gcc4, thank's to Andreas Jochens
	patch -Np1 -i ../gcc4.patch || return 1
	./configure --prefix=/usr --with-zlib
	make || return 1
	make prefix=$startdir/pkg/usr install
}