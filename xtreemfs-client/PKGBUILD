# Contributor: Karol Maciaszek <karol.maciaszek@czystybeton.pl>
pkgname=xtreemfs-client
pkgver=1.0.0
pkgrel=1
pkgdesc="A distributed and replicated file system for the Internet (client)" 
url="http://www.xtreemfs.org" 
license="GPLv2" 
arch=(i686 x86_64)
depends=('python') 
makedepends=()
md5sums=('596c3c51ba5032e34827be6065dfadd9')
_pkgname=XtreemFS
source=("http://xtreemfs.googlecode.com/files/$_pkgname-$pkgver.tar.gz")
build() { 
	cd $startdir/src/$_pkgname-$pkgver || return 1
	make client || return 1
	install -d $startdir/pkg/etc/xos/xtreemfs || return 1
	install -m 644 $startdir/src/$_pkgname-$pkgver/etc/xos/xtreemfs/default_dir $startdir/pkg/etc/xos/xtreemfs/ || return 1
	install -d $startdir/pkg/usr/bin || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/bin/xtfs_sp $startdir/pkg/usr/bin/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/bin/xtfs_umount $startdir/pkg/usr/bin/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/src/client/bin/xtfs_lsvol $startdir/pkg/usr/bin/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/src/client/bin/xtfs_mkvol $startdir/pkg/usr/bin/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/src/client/bin/xtfs_mount $startdir/pkg/usr/bin/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/src/client/bin/xtfs_rmvol $startdir/pkg/usr/bin/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/src/client/bin/xtfs_stat $startdir/pkg/usr/bin/ || return 1
	install -d $startdir/pkg/usr/share/man/man1 || return 1
	gzip -9 $startdir/src/$_pkgname-$pkgver/man/man1/*
	install -m 755 $startdir/src/$_pkgname-$pkgver/man/man1/xtfs_lsvol.1.gz $startdir/pkg/usr/share/man/man1/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/man/man1/xtfs_mkvol.1.gz $startdir/pkg/usr/share/man/man1/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/man/man1/xtfs_mount.1.gz $startdir/pkg/usr/share/man/man1/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/man/man1/xtfs_rmvol.1.gz $startdir/pkg/usr/share/man/man1/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/man/man1/xtfs_sp.1.gz $startdir/pkg/usr/share/man/man1/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/man/man1/xtfs_stat.1.gz $startdir/pkg/usr/share/man/man1/ || return 1
	install -m 755 $startdir/src/$_pkgname-$pkgver/man/man1/xtfs_umount.1.gz $startdir/pkg/usr/share/man/man1/ || return 1

}

