# Maintainer: Artefact2 <artefact2@gmail.com>
# Contributor: shahid <helllamer@gmail.com>

pkgname=bitcoin-daemon-cuda
_pkgname=bitcoin
_svnrev=155
pkgver=svn155
pkgrel=1
pkgdesc="Bitcoin is a peer-to-peer network based digital currency."
arch=(i686 x86_64)
url="http://www.bitcoin.org/"
depends=(cuda expat gcc-libs "boost-libs>=1.43" gcc44)
makedepends=(boost gcc make findutils subversion)
license=('MIT')
install="bitcoin-daemon-cuda.install"
source=(makefile.archlinux
	      bitcoin-daemon-cuda.install
	      rc.bitcoind-cuda
	      bitcoin_r155_cuda.patch)
md5sums=(05901943ef4c3c5146e886323892ac1b
         ca830a7a960c6626312cc0be0d1e0796
         1446cb1685292b1206268ca302158e2b
         6c2db019ef0d691a64d1535da30c4b27)

build() {
	cd $srcdir
	svn co https://bitcoin.svn.sourceforge.net/svnroot/bitcoin@${_svnrev} bitcoin

	# copy correct makefile to src dir
	cp $srcdir/makefile.archlinux $srcdir/bitcoin/trunk/Makefile

	# to build (single-threaded make due to OOM issues)
	cd $srcdir/bitcoin/trunk
	patch < $srcdir/bitcoin_r*_cuda.patch
	make bitcoind
}

package() {
	mkdir -p $pkgdir/{usr/bin,etc/rc.d,opt/bitcoin-daemon-cuda}

	install -D -m755 $srcdir/bitcoin/trunk/bitcoind $pkgdir/usr/bin/bitcoind-cuda
	install -D -m755 rc.bitcoind-cuda $pkgdir/etc/rc.d/bitcoind-cuda

	# strip shit from executables
	find $pkgdir/usr/bin/ -type f | xargs -L1 strip

	# the bitcoin data directory should not readable by others (wallet is sensitive data)
	chown -R 8333:8333 $pkgdir/opt/bitcoin-daemon-cuda
	chmod -R 700 $pkgdir/opt/bitcoin-daemon-cuda
}
