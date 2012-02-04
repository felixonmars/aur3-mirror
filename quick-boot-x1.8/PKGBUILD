# quick-boot
# Maintainer: ying <Jinoto Systems>
# Contributor: ying <Jinoto Systems>


pkgname=quick-boot-x1.8
pkgver=1
pkgver2=0.20050517.0220
pkgrel=1
pkgdesc="Quick system bootup scripts for Xorg>=1.8. Based on quick-boot."
arch=('i686' 'x86_64')
url="http://malisch-ts.de"
license=('GPL')
backup=(etc/inittab)
groups=('base')
install=quick-boot.install
conflicts=('quick-init' 'readahead' 'quick-boot-x1.7' 'quick-boot-x1.8')
replaces=('quick-init' 'readahead')
depends=('xorg-server>=1.8' 'gcc-libs' 'glibc' 'bash' 'awk' 'grep' 'coreutils' 'sed' 'udev>=139-1' 'net-tools' 'kbd' 'findutils' 'sysvinit' 'initscripts')
makedepends=('gcc' 'file' 'util-linux-ng')
source=(boot
qinit.sysinit
qinit.multi
qinittab
inittab.backup
https://launchpad.net/ubuntu/jaunty/+source/readahead-list/1:${pkgver2}-1ubuntu5/+files/readahead-list_${pkgver2}.orig.tar.gz
https://launchpad.net/ubuntu/jaunty/+source/readahead-list/1:${pkgver2}-1ubuntu5/+files/readahead-list_${pkgver2}-1ubuntu5.diff.gz
readahead-list-desktop
readahead-watch-desktop)


build() {
	mkdir ${pkgdir}/etc/
	mkdir ${pkgdir}/etc/readahead
	touch ${pkgdir}/etc/readahead/boot
	touch ${pkgdir}/etc/readahead/desktop
	mkdir -p ${pkgdir}/etc/rc.d/
	cp readahead-list-desktop ${pkgdir}/etc/rc.d/
	cp readahead-watch-desktop ${pkgdir}/etc/rc.d/
	patch -p1 < readahead-list_${pkgver2}-1ubuntu5.diff

	cd "$srcdir/readahead-list-$pkgver2"

	for pat in ../debian/patches/*.patch; do
	patch -p1 < $pat
	done

	./configure --prefix=/usr --mandir=/usr/share/man
	make || return 1
	make DESTDIR="$pkgdir/" install


	cd $srcdir
	install -D -m755 $srcdir/qinit.sysinit $pkgdir/etc/qinit.sysinit
	install -D -m755 $srcdir/qinit.multi $pkgdir/etc/qinit.multi
	install -D -m755 $srcdir/qinittab $pkgdir/etc/qinittab
	install -D -m755 $srcdir/inittab.backup $pkgdir/etc/inittab.backup
	install -D -m755 $srcdir/boot $pkgdir/etc/readahead/boot
}

md5sums=('861264e87a71a35f269bbf29966071e7'
			'b13be4fae3904fb2b3f94c27978ec825'
			'1fa40b44f1027d2ae3ac4f667ffd7cab'
			'5c7c3efb1b64ec507ea59f7eb3b852b9'
			'39f6226f974cd233af615042b3a67690'
			'a67ec6f8805ff67d3ff97570fa5be5ae'
			'e6fe46a225b68ce4fd91bb117151f58c'
			'93bd4d10c6fded4c858514b00a050b4e'
			'bb39fa1e7d5c662c466698e068920198')


