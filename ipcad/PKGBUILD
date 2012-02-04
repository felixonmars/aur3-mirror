# Contributor: Konstantin Sharlaimov <konstantin.sharlaimov@gmail.com>
pkgname=ipcad
pkgver=3.7.3
pkgrel=1
pkgdesc="IP Cisco Accounting Daemon"
arch=('i686')
url="http://lionet.info/ipcad/"
license="GPL"
source=('http://lionet.info/soft/ipcad-3.7.3.tar.gz' 'ipcad' 'ipcad.dump')
md5sums=('125605249958894148ec26d3c88189f5' 'b61b0ffa3ace50342b0b5ffff2256e60'\
         'd41d8cd98f00b204e9800998ecf8427e')
depends=('netkit-rsh' 'libpcap')
backup=(etc/ipcad/ipcad.conf)

build() {
	cd ${startdir}/src/${pkgname}-${pkgver}/

	mkdir -p ${startdir}/pkg
	mkdir -p ${startdir}/pkg/usr
	mkdir -p ${startdir}/pkg/etc/
	mkdir -p ${startdir}/pkg/etc/rc.d
	mkdir -p ${startdir}/pkg/usr/man/man8/
	mkdir -p ${startdir}/pkg/usr/man/man5/
	mkdir -p ${startdir}/pkg/adm/tmp

	./configure --prefix=/usr --sysconfdir=/etc/ipcad --mandir=/usr/man --enable-static --disable-shared
	make || return 1
	make DESTDIR=${startdir}/pkg install
	make DESTDIR=${startdir}/pkg install-man

	install -m 755 ${startdir}/src/ipcad ${startdir}/pkg/etc/rc.d
	install -m 600 ${startdir}/src/ipcad.dump ${startdir}/pkg/adm/tmp
}
