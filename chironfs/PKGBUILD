# Maintainer: Yanus Poluektovich <ypoluektovich at gmail dot com>
pkgname=chironfs
pkgver=1.1.1
pkgrel=1
pkgdesc="FUSE based filesystem which implements replication at the FILESYSTEM LEVEL like RAID 1 does at the DEVICE LEVEL"
arch=('x86_64')
url="http://furquim.org/chironfs"
license=('GPL3')
groups=()
depends=('fuse')
source=("http://chironfs.googlecode.com/files/chironfs-$pkgver.tar.gz"
        "configure.ac.patch")
sha1sums=('cc92d8ed39a1594da0422408daf080681efe7ba5'
          '9451bde61b50afb95a60b91f3b9524be6e653086')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"

	msg2 "Patching configure.ac"
	patch -p0 -i "$srcdir/configure.ac.patch"

	msg2 "Running aclocal"
	aclocal

	msg2 "Creating missing files for autoreconf"
	automake --add-missing

	msg2 "Running autoreconf"
	autoreconf
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	make -k check
}

package() {
	msg2 "Running make install"
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

	msg2 "Removing unneeded files"
	cd "$pkgdir"
	rm -f usr/share/doc/chironfs/{changelog.Debian,copyright,NEWS}
}
