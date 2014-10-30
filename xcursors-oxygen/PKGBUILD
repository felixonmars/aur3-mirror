# Maintainer: Joel Almeida <aullidolunar at gmail dot c0m>
# Former maintainer: Gently <toddrpartridge@gmail.com>

pkgname=xcursors-oxygen
pkgver=0.0.2012.06
pkgrel=1
pkgdesc="KDE oxygen theme X.org server cursors"
arch=('any')
url="https://packages.debian.org/wheezy/oxygencursors"
license=('GPL')
source=("http://http.us.debian.org/debian/pool/main/o/oxygencursors/oxygencursors_0.0.2012-06-kde4.8-2.1_all.deb")
md5sums=('23c6fdd4d56c7998f448726727e34fc9')
conflicts=('kdebase-workspace')

package() {
	cd "$srcdir"
	mkdir "$srcdir/tmp"
	tar -xf data.tar.xz -C "$srcdir/tmp"
	# remove useless stuff
	rm -rf "$srcdir/tmp/usr/share/icons/default"
	rm "$srcdir/tmp/usr/share/doc/oxygencursors/changelog.Debian.gz"
	# Copy the goodies
	install -dm755 "$pkgdir/usr/share"
	cd "$srcdir/tmp/usr/share"
	cp . -R "$pkgdir/usr/share"
	rm -rf "$srcdir/tmp"
}

build() {
	cd "$srcdir"
}
