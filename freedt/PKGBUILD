# Contributor: Scytrin dai Kinthra <scytrin@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=freedt
pkgver=0.21
pkgrel=8
pkgdesc="A reimplementation of Dan Bernstein's daemontools under the GNU GPL"
arch=('i686' 'x86_64')
url="http://offog.org/code/freedt.html"
license=("GPL")
depends=('glibc')
source=(http://offog.org/files/$pkgname-$pkgver.tar.gz rc.svscan envdir.8 ratelimit.8 recordio.8 argv0.8)

md5sums=('28484635b0e149d00b872b6b0d935683'
         'afdaaacea85434cfd2b46b430011a79e'
         '841de6acbee898bc7f3f5dc46c374d56'
         '0e3d96e23163cfb69618de6914d3c2de'
         'c09b917f166103977ded206442e70f7b'
         'd155fa18c507f0882ae526f7d458b608')

build() {
	cd $srcdir/$pkgname-$pkgver
	./configure --prefix=$pkgdir/usr || return 1
	make || return 1
	make install || return 1

	install -d $pkgdir/usr/man/man8
	install -m 0644 ../envdir.8 ../ratelimit.8 ../recordio.8 ../argv0.8 $pkgdir/usr/man/man8
	install -D -m 0755 $srcdir/rc.svscan $pkgdir/etc/rc.d/svscan
}
