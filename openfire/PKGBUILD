# Maintainer: Pierre Schmitz <pierre@archlinux.de>

pkgname=openfire
pkgver=3.7.1
pkgrel=6
pkgdesc="A high performance XMPP (Jabber) server"
arch=('any')
url='http://www.igniterealtime.org/projects/openfire/'
license=('GPL')
depends=('openjdk6' 'bash')
makedepends=('openjdk6' 'apache-ant')
install='openfire.install'
backup=('opt/openfire/conf/openfire.xml' 'etc/conf.d/openfire' 'opt/openfire/resources/security/keystore')
source=("http://www.igniterealtime.org/downloadServlet?filename=openfire/openfire_src_${pkgver//./_}.tar.gz"
        'openfire' 'openfire.service' 'openfire.conf' 'jdk7.patch')
md5sums=('c8650cf8d58457ec960648527613e48b'
         '2666dcc425a984112624dbe7e0071b35'
         'ca80d6452c44d8d5ff7b404cf6b30690'
         '70727798fbcc3e23c10af81c73287791'
         'a8340df59015bf6369508844e97ce055')

build() {
	cd ${srcdir}/openfire_src/build
	patch -p1 -i ${srcdir}/jdk7.patch
	rm -rf ../src/resources/nativeAuth/
	ant openfire
# 	ant plugins
}

package() {
	install -d -m755 ${pkgdir}/opt/openfire
	install -d -m750 ${pkgdir}/var/log/openfire
	install -D -m644 $srcdir/openfire.conf ${pkgdir}/etc/conf.d/openfire
	install -D -m774 $srcdir/openfire ${pkgdir}/etc/rc.d/openfire
	install -D -m644 $srcdir/openfire.service ${pkgdir}/usr/lib/systemd/system/openfire.service
	cd ${srcdir}/openfire_src/target/openfire
	rm -rf bin logs
	mv * ${pkgdir}/opt/openfire/
}
