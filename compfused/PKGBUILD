# Contributor: Francesc Ortiz <francescortiz@gmail.com>
pkgname=compfused
pkgver=200705823
pkgrel=1
pkgdesc="Fuse transparent compressed read-write for linux filesystems"
arch=()
url="http://parallel.vub.ac.be/~johan/compFUSEd/"
license=('GPL')
depends=(fuse bzip2 lzo lzo2 zlib)
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
install=
source=(http://parallel.vub.ac.be/~johan/compFUSEd/index.php/option/downloads/task/download/id/8)
noextract=()
md5sums=('b4322e48f102a8902ee031e17420b2e8')

build() {
	cd $startdir/src
	mv 8 cf-GISMO-200705823.tgz
	tar xvzf cf-GISMO-200705823.tgz
	cd $startdir/src/CompFused/Gismo

	# fix etc paths to match arch linux
	sed -i 's/\/usr\/local\/etc\//\/etc\/compFUSEd\//g' cf_defines.h || return 1
	sed -i 's/\/usr\/local\/etc\//\/etc\/compFUSEd\//g' compFUSEd.conf || return 1
	sed -i 's/\/usr\/local\/lib\//\/usr\/lib\/compfused\//g' compFUSEd.conf || return 1

	make || return 1
	# CREATES ERRORS!
	#make cf_extract || return 1
	
	# binaries
	mkdir -p $startdir/pkg/usr/sbin
	cp $startdir/src/CompFused/Gismo/cf_main $startdir/pkg/usr/sbin || return 1
	cp $startdir/src/CompFused/Gismo/cf_inspect $startdir/pkg/usr/sbin || return 1
	cp $startdir/src/CompFused/Gismo/cf_fsinfo $startdir/pkg/usr/sbin || return 1
	# CREATES ERRORS!
	#cp $startdir/src/CompFused/Gismo/cf_extract $startdir/pkg/usr/sbin || return 1

	# plugins
	mkdir -p $startdir/pkg/usr/lib/compfused
	cp $startdir/src/CompFused/Gismo/plugins/*.so $startdir/pkg/usr/lib/compfused || return 1

	# conf
	mkdir -p $startdir/pkg/etc/compFUSEd
	cp $startdir/src/CompFused/Gismo/compFUSEd.conf $startdir/pkg/etc/compFUSEd || return 1
}
