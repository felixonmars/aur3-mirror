# Contributor: T - rttommy@gmail.com
pkgname=gopreload
pkgver=0.5
pkgrel=3
pkgdesc="Preloads files needed for given programs."
url="http://forums.gentoo.org/viewtopic-t-622085-highlight-preload.html"
arch=('any')
license=('GPL')
depends=('strace')
source=(http://wpage.unina.it/aorefice/GOPreload-0.5.tar.gz
gopreload-prepare
gopreload
rc.gopreload)
md5sums=('444658675525fc10e8934ebec05d1135' '78ea51f6a95f44d6a75addc2197cacf5' 'fda152c22a9264d28b532b8dc822fcc2' '359c7b62fa632f1490f4be8dc1358728')
install=gopreload.install
build() {
	cd "$startdir"
	mkdir -p $pkgdir/usr/share/
	cp -r src/GOPreload-0.5 "$pkgdir/usr/share/gopreload"
	install -D -m755 gopreload pkg/usr/bin/gopreload
	install -D -m755 gopreload-prepare pkg/usr/bin/gopreload-prepare
	install -D rc.gopreload $pkgdir/etc/rc.d/gopreload
	chmod 777 $pkgdir/usr/share/gopreload/enabled
	chmod 777 $pkgdir/usr/share/gopreload/disabled
}
