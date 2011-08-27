# Contributor: Karol Maciaszek <karol.maciaszek@czystybeton.pl>
pkgname=xtreemfs-server
pkgver=1.0.0
pkgrel=1
pkgdesc="A distributed and replicated file system for the Internet (server)" 
url="http://www.xtreemfs.org" 
license="GPLv2" 
arch=(i686 x86_64)
depends=('java-runtime' 'python') 
makedepends=('apache-ant')
md5sums=('596c3c51ba5032e34827be6065dfadd9' '9d759349a792001a05fa1825024c5d7b' '153fd7c16b4ff7cf06375f45d882fd46' 'be18d26e8dd3113ff6f35bb8652b135e')
_pkgname=XtreemFS
source=("http://xtreemfs.googlecode.com/files/$_pkgname-$pkgver.tar.gz" "xtreemfs-dir.patch" "xtreemfs-mrc.patch" "xtreemfs-osd.patch")
build() { 
	cd $startdir/src/$_pkgname-$pkgver || return 1
	make server || return 1
	install -d $startdir/pkg/usr/share/java || return 1
	install -m 644 $startdir/src/$_pkgname-$pkgver/src/servers/lib/BabuDB-0.1.0-RC.jar $startdir/pkg/usr/share/java/ || return 1
	install -m 644 $startdir/src/$_pkgname-$pkgver/src/servers/dist/XtreemFS.jar $startdir/pkg/usr/share/java/ || return 1
	install -d $startdir/pkg/etc/xos/xtreemfs
	install -m 644 $startdir/src/$_pkgname-$pkgver/etc/xos/xtreemfs/dirconfig.properties $startdir/pkg/etc/xos/xtreemfs/
	install -m 644 $startdir/src/$_pkgname-$pkgver/etc/xos/xtreemfs/mrcconfig.properties $startdir/pkg/etc/xos/xtreemfs/
	install -m 644 $startdir/src/$_pkgname-$pkgver/etc/xos/xtreemfs/osdconfig.properties $startdir/pkg/etc/xos/xtreemfs/
	install -d $startdir/pkg/etc/rc.d
	install -m 755 $startdir/src/$_pkgname-$pkgver/etc/init.d/xtreemfs-mrc $startdir/pkg/etc/rc.d/ || return 1
	patch $startdir/pkg/etc/rc.d/xtreemfs-mrc $startdir/xtreemfs-mrc.patch || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/etc/init.d/xtreemfs-dir $startdir/pkg/etc/rc.d/
	patch $startdir/pkg/etc/rc.d/xtreemfs-dir $startdir/xtreemfs-dir.patch || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/etc/init.d/xtreemfs-osd $startdir/pkg/etc/rc.d/ || return 1
	patch $startdir/pkg/etc/rc.d/xtreemfs-osd $startdir/xtreemfs-osd.patch || return 1
}

