# Maintainer: Shaw <puxx@mail.ustc.edu.cn>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: Jimmy Tang <jtang@tchpc.tcd.ie>

pkgname=ttyrec-git
pkgver=20130918
pkgrel=1
pkgdesc="A tty recorder and player - this is not the official upstream version"
arch=('i686' 'x86_64')
url="http://git.kitenet.net/?p=ttyrec.git"
license=('BSD')
depends=('glibc')
makedepends=('git')
provides=('ttyrec')
conflicts=('ttyrec')
source=('git://git.kitenet.net/ttyrec.git')
md5sums=('SKIP')

build() {
	cd "$srcdir/ttyrec"
	make CFLAGS+="-DSVR4 -DHAVE_inotify -D_XOPEN_SOURCE=500"
}

package() {
	cd "$srcdir/ttyrec"
	# install executable files
	install -Dm755 ttyrec $pkgdir/usr/bin/ttyrec
	install -Dm755 ttyplay $pkgdir/usr/bin/ttyplay
	install -Dm755 ttytime $pkgdir/usr/bin/ttytime
	# install README
	install -Dm644 README $pkgdir/usr/share/doc/ttyrec/README
	# install man page
	install -Dm644 ttyrec.1 $pkgdir/usr/share/man/man1/ttyrec.1
	install -Dm644 ttyplay.1 $pkgdir/usr/share/man/man1/ttyplay.1
	install -Dm644 ttytime.1 $pkgdir/usr/share/man/man1/ttytime.1
}

