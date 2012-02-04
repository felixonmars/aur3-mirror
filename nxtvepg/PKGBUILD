# Contributor: Perry3D <perry3d at gmail dot com>
# Previous: Gilles CHAUVIN <gcnweb at gmail dot com>

pkgname=nxtvepg
pkgver=2.8.1
pkgrel=2
pkgdesc="A decoder for nexTView EPG an Electronic TV Programme Guide"
url="http://nxtvepg.sf.net/"
license="GPL"
depends=('tcl>=8.5.0' 'tk' 'libxmu')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz \
tcl_85.patch \
$pkgname-icon-16.png $pkgname-icon-32.png $pkgname-icon-48.png \
$pkgname.desktop)
arch=('i686' 'x86_64')

build() {
	cd $startdir/src/$pkgname-$pkgver

	msg "Applying patch for tcl/tk8.5..."
	patch -p0 < ../tcl_85.patch

	make || return 1

	make prefix=$startdir/pkg/usr/ \
	bindir=$startdir/pkg/usr/bin \
	resdir=$startdir/pkg/usr/share/X11 \
	INST_DB_DIR=$startdir/pkg/var/tmp/nxtvdb \
	cfgdir=$startdir/pkg/usr/share/nxtvepg \
	install

	# Icons
	for size in 16 32 48; do
		install $startdir/src/$pkgname-icon-$size.png -D -m644 $startdir/pkg/usr/share/pixmaps/$pkgname-icon-$size.png
	done

	# .desktop file
	install $startdir/src/$pkgname.desktop -D -m644 $startdir/pkg/usr/share/applications/$pkgname.desktop
}
md5sums=('0811b1b95537b3cbab9f8d18d1501411'
         'db5e77089204aeb35e84c7f5505664a6'
         '5f7c220d3355b6f043a2bdd5acec8608'
         '8988d3f33a90bd99f9a61d8f7e4f46c3'
         '26d86bd935df1dc9328f07b879f30de2'
         '5d14ff096ef811ccb7dc330e5d3a76fd')
