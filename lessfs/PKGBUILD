# Maintainer: mindcat <444303908@qq.com>

pkgname=lessfs
pkgver=1.7.0
pkgrel=1
pkgdesc="High performance inline data deduplicating file system for FUSE"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.lessfs.com/"

makedepends=('gcc' 'make' 'tokyocabinet' 'fuse' 'mhash' 'openssl')
depends=('tokyocabinet' 'mhash' 'openssl' 'lzo2')
optdepends=('hamsterdb: alternative database backend'
            'db: alternative database backend')
backup=('etc/lessfs/sample.cfg')
#conflicts=("$_pkgname")
#provides=("$_pkgname=$pkgver")

source=(http://sourceforge.net/projects/lessfs/files/lessfs/lessfs-$pkgver/lessfs-$pkgver.tar.gz/download)
sha1sums=('6b5e3b47b562e0ef0e8fd1b499a4bd03e2aff60e')

build() {
	cd "$pkgname-$pkgver"
        depts="--with-crypto --with-lzo"

        if ( pacman -Q hamsterdb 2>/dev/null >/dev/null ); then
            echo "Building with HamsterDB support";
            depts="$depts --with-hamsterdb"
        else
            echo "==================================";
            echo " WARNING!";
            echo "hamsterdb not found, skipping dependancy!";
            echo "==================================";
        fi

        if ( pacman -Q db 2>/dev/null >/dev/null ); then
            depts="$depts --with-berkeleydb"
            echo "Building with BerkeleyDB support";
        else
            echo "==================================";
            echo " WARNING!";
            echo "Berkley DB (db) not found, skipping dependancy!";
            echo "==================================";
        fi

        if ( pacman -Q snappy 2>/dev/null >/dev/null ); then
            depts="$depts --with-snappy"
            echo "Building with snappy compression support";
        else
            echo "==================================";
            echo " WARNING!";
            echo "Google Snappy (snappy) not found, skipping dependancy!";
            echo "==================================";
        fi

	./configure $depts --prefix=/usr  || return 1 ;

	make || return 1
	make prefix="$pkgdir/usr" install || return 1
        mv $pkgdir/usr/sbin/* "$pkgdir/usr/bin/"
        rmdir "$pkgdir/usr/sbin/"
        mkdir -p "$pkgdir/etc/lessfs"
        install -m 644 -D etc/lessfs.cfg-hamsterdb $pkgdir/etc/lessfs/sample.cfg-hamsterdb
        install -m 644 -D etc/lessfs.cfg-tokyocabinet $pkgdir/etc/lessfs/sample.cfg-tokyocabinet
        install -m 644 -D etc/lessfs.cfg-bdb $pkgdir/etc/lessfs/sample.cfg-bdb
        install -m 644 -D etc/lessfs.cfg $pkgdir/etc/lessfs/sample.cfg
        mkdir -p "$pkgdir/usr/share/doc/lessfs"
        install -m 644 -D COLLISION.probability COPYING FAQ README README.berkeleydb README.chunk_io README.crypto README.file_io README.performance_or_suffer README.replication README.upgrade_to_1.5.2_with_replication ChangeLog "$pkgdir/usr/share/doc/lessfs"
}
