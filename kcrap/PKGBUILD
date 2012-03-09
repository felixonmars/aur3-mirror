# Maintainer: Dan Fuhry <dan@fuhry.us>
# :mode=shellscript:
pkgname=kcrap
pkgver=0.2.3
pkgrel=5
pkgdesc="Kerberos Challenge Response Authentication Protocol"
license=('MIT')
depends=('krb5')
url="http://www.spock.org/kcrap/"
source=("http://www.spock.org/kcrap/kcrap-${pkgver}.tar.bz2"
		"kcrap-0.2.3-gcc-no-soname.patch"
		"kcrap-0.2.3-mit-krb5-1.9.patch"
		"kcrap-0.2.3-cfg-file-location.patch"
		"kcrap-0.2.3-ntlm-extra.patch"
		"kcrap"
		)
sha1sums=('e1e179865a604fe69548c116ad098bf0a3630160'
          '39974b7db71c575a97e507a5ca6db8422405b658'
          'e35f78545124299b10b79e9d169f646832afe180'
          '6c48368b90eb7a2da3f299e65b7694b4a5d45673'
          '02739fe64c996820c754af4452f54a90926b1167'
          '55855e65f1234c7051cd9d54f0adea5bb84b6db2')

arch=('i686' 'x86_64')
backup=('etc/kcrap_server.conf')

build()
{
	cd "${srcdir}/kcrap-${pkgver}"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-gcc-no-soname.patch"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-mit-krb5-1.9.patch"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-cfg-file-location.patch"
	patch -Np1 -i "${srcdir}/kcrap-0.2.3-ntlm-extra.patch"
	
	./configure --prefix=/usr --sysconfdir=/etc CFLAGS=-I/usr/include/et
	make
}

package() {
	cd "${srcdir}/kcrap-${pkgver}"
	make install DESTDIR="${pkgdir}"
	mkdir -p "${pkgdir}/etc/"
	cp -v "server/kcrap_server.conf" "${pkgdir}/etc/"
	mkdir -p "${pkgdir}/etc/rc.d"
	cp -v "${srcdir}/kcrap" "${pkgdir}/etc/rc.d/"
}
