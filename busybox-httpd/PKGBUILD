# Contributor: Thomas Mudrunka <harvie@@email..cz>
# Maintainer:  Thomas Mudrunka <harvie@@email..cz>
# You can also contact me on http://blog.harvie.cz/

pkgname=busybox-httpd
pkgver=1
pkgrel=2
pkgdesc="BusyBox HTTPd integration with Arch. Support for IPv6,MIME,CGI,PHP,PERL,Python,BASH,BasicHTTPAuth,Access control and more. Usefull for embeded systems or chroots."
arch=('any')
license=('GPL')
url="http://www.busybox.net/"
depends=('busybox')
optdepends=('php: dynamic pages support')
backup=('etc/busybox/httpd.conf' 'etc/busybox/httpd-rc.conf')
source=(busybox-httpd busybox-httpd-rc busybox-httpd-watch httpd.conf httpd-rc.conf)
md5sums=('3bdf984a53c1361bc2a28ff33542ea74'
         '46c0e5fa50b84d93cb34d7bc2563e34a'
         'd897aba2f008d911c97a837f9645ffc9'
         'd8ae5de2c6a10a1b68c85304bf58da72'
         '41e20b684539b665bce653a64aa37972')

build() {
	cd "$srcdir"

	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/etc/rc.d
	mkdir -p "$pkgdir"/etc/busybox

	cp busybox-httpd "$pkgdir"/usr/bin/
	cp busybox-httpd-watch "$pkgdir"/usr/bin/
	cp busybox-httpd-rc "$pkgdir"/etc/rc.d/busybox-httpd
	cp httpd.conf "$pkgdir"/etc/busybox
	cp httpd-rc.conf "$pkgdir"/etc/busybox

	chmod -R 755 "$pkgdir"
	#protect potential passwords
	chown -R root:http "$pkgdir"/etc/busybox/httpd.conf
	chmod -R 740 "$pkgdir"/etc/busybox/httpd.conf
}
