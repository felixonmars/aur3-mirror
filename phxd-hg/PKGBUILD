pkgname=phxd-hg
pkgver=29.d6067784680d
pkgrel=1
pkgdesc="A hotline server written in python."
url="https://bitbucket.org/jvoss"
arch=(any)
license=("unknown")
depends=(python2)
makedepends=(python2 mercurial)
install=phxd.install
source=("hg+https://bitbucket.org/jvoss/phxd"
"phxd.service")
md5sums=('SKIP' 'addbc5cccaae7d8906422ec7638911c4')

pkgver() {
	cd $srcdir/${pkgname%-*}
	hg identify -ni | awk 'BEGIN{OFS=".";} {print $2,$1}'
}

build() {
	cd "${srcdir}/${pkgname%-*}"
	sed -i "s,/usr/bin/env python,/usr/bin/python2," phxd.py
}

package() {
	cd "${srcdir}/${pkgname%-*}"
	install -Dm755 "phxd.py" "$pkgdir/srv/phxd/phxd.py"
	install -Dm644 "$srcdir/phxd.service" "$pkgdir/usr/lib/systemd/system/phxd.service"
	cp -r "ssl" "$pkgdir/srv/phxd/"
	mkdir -p "$pkgdir/usr/bin"
	ln -s "/srv/phxd/phxd.py" "$pkgdir/usr/bin/phxd"
}
