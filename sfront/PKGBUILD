# Maintainer: kusakata <shohei atmark kusakata period com>

pkgname=sfront
pkgver=0.99
pkgrel=1
pkgdesc="A translator that converts MP4-SA files into efficient C programs that generate audio for rendering, interactive and plug-in applications"
arch=('i686' 'x86_64')
url="http://www.cs.berkeley.edu/~lazzaro/sa/"
license=('BSD')
depends=('glibc')
source=("http://www.cs.berkeley.edu/~lazzaro/sa/sfront.tar.gz")

build() {
	cd "${srcdir}/sfront/src"
	make
	make install
}

package() {
	cd "${srcdir}/sfront"
	
	install -Dm755 bin/sfront "${pkgdir}/usr/bin/sfront"
	install -Dm644 copyright/bsd.html "${pkgdir}/usr/share/licenses/${pkgname}/bsd.html"
	
	mkdir "$pkgdir/usr/share/${pkgname}"
	cp -r lib/Slib "$pkgdir/usr/share/${pkgname}"
	cp -r lib/reson "$pkgdir/usr/share/${pkgname}"
}

md5sums=('a950055e852711cfaff882570a92e663')
