# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=xtrabackup
pkgver=2.1.7
pkgrel=1
pkgdesc="A MySQL non-blocking backup solution for InnoDB and XtraDB (Percona Server) data."
arch=("i686" "x86_64")
url="http://www.percona.com/software/percona-xtrabackup/"
license=('GPL')
depends=("perl" "libaio" "libgcrypt")
makedepends=("python-sphinx")

source=("http://www.percona.com/downloads/XtraBackup/XtraBackup-$pkgver/source/percona-$pkgname-$pkgver.tar.gz"
    build.patch)

prepare() {
    cd "$srcdir/percona-$pkgname-$pkgver"
    patch -p0 -i "$srcdir/build.patch"
}

build() {
    cd "$srcdir/percona-$pkgname-$pkgver"
    export CFLAGS="$CFLAGS -Wno-sizeof-pointer-memaccess -Wno-maybe-uninitialized -Wno-unused -Wno-array-bounds -Wno-error"
    export CXXFLAGS="$CXXFLAGS -Wno-sizeof-pointer-memaccess -Wno-maybe-uninitialized -Wno-unused -Wno-array-bounds -Wno-error"
    utils/build.sh innodb56

    cd doc
    make man
}

package() {
	cd "$srcdir/percona-$pkgname-$pkgver"
    for f in xtrabackup_56 xbcrypt xbstream; do
        install -Dm0755 src/$f "$pkgdir"/usr/bin/$f
    done
    install -Dm0755 innobackupex "$pkgdir"/usr/bin/innobackupex

    cd doc/build/man
    for man in *.1; do
		install -Dm0644 $man "$pkgdir"/usr/share/man/man1/$man
	done
}

sha256sums=('b0a89dd805fe25d1fd00c3f84b43d59e88173a19e2075d444a116118e2623587'
            '05fc1ba879d2d32512919c790c8cfd7abbfe0261c947825c9597aac7b482c384')
