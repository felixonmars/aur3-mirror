# Former Maintainer: Pierre Schmitz <pierre@archlinux.de>
# Contributor: Leonardo A. Gallego <leonardo@archlinux-es.org>
# Contributor: Jeremy Sands <cto@jeremysands.com>

pkgname=khacc
pkgver=3.3
pkgrel=1
license="GPL"
arch=('i686' 'x86_64')
options=(libtool)
pkgdesc="Simple home accounting application, KDE3 version."
url="http://qhacc.sourceforge.net/"
depends=('qhacc' 'kdelibs3')
source=(http://downloads.sourceforge.net/qhacc/$pkgname-$pkgver.tar.gz khacc.desktop)
md5sums=('00f04073cfef27a104cfa745e25532e3'
         '98715659e34cc19ab40fa7d74c8951d7')
sha1sums=('594afe6d635aa630b3bba2536604175c28988ec5'
          '5b14c8a4df57285f18312bf630aa875060bea7e5')
sha256sums=('3b12f856a1931254f0e14ce927cb8369546e725ea4bc8fa7846d03a13b1b225f'
            '80e8c8807d507a7387b358090c744360d104e51a25406d624906c4b39d0ed559')
sha384sums=('3eca96267d7c652c46cdffe9d1aa6db704e5bcdaf578c55411998d405fc49d5aa8339b46092a155cb43c75fcef3edb33'
            '8a15ea4cce15a5df59fe898bb446f5185061c4bfed80ce33e0b43d5929801f533c63cd69c906e6885e483ff664128e54')
sha512sums=('c6862d92cf9338f1d3330a3e00a28945385b00b082f1fcac51b8cd9ae31ec00df7a09d6ea39c03a59e51eeb171d1a12fd5d2185d66754cd7894518a1a9c5ed3f'
            '2221cd5b4a868b78452f7e3b728a7b944d504fa36a2290da81368f604cca2976038536701f73804609d4847ba1bf78a87b085957238ce701008875f70926663e')

build() {
	cd $startdir/src/$pkgname-$pkgver
#	patch -p1 -s <../qhacc-missing-include.patch || return 1
	(
	unset LD_PRELOAD
	./configure --prefix=/usr --with-qhacc-config=/usr/bin --without-arts --with-qt-dir=/opt/qt --with-qt-includes=/opt/qt/include --with-qt-libraries=/opt/qt/lib || return 1
	)
	sed -i -e 's.^DEFAULT_INCLUDES = .DEFAULT_INCLUDES = -I/opt/kde/include .' -e 's.^all_libraries = -L/usr/lib .all_libraries = -R/usr/lib/qhacc -L/usr/lib/qhacc.' -e 's.^X_LDFLAGS = -L/usr/lib.X_LDFLAGS = .' khacc/Makefile
	make -j1 || return 1
	make DESTDIR=$startdir/pkg/ install || return 1
	install -m 755 -d $startdir/pkg/usr/share/applications
	install -m 644 ../khacc.desktop $startdir/pkg/usr/share/applications
	rm -fr $startdir/pkg/usr/share/applnk
}
