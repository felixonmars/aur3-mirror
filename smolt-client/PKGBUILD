# Contributor: Otavio Souza <leader@kinuxlinux.org>

pkgname=smolt-client
pkgver=1.4
pkgrel=1
pkgdesc="The Fedora Smolt Client"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/smolt/wiki"
license=('GPL')
depends=('urlgrabber' 'python-simplejson' 'pyqt>=4.3.0' 'python>=2.4')
backup=(etc/smolt/config.py)

source=(\
	https://fedorahosted.org/releases/s/m/smolt/smolt-1.4.tar.gz \
	001-Client-Hopefully-fix-encoding-trouble.patch \
	002-ArchLinux-patch.diff\
)

md5sums=('a5a56912381e71f75b4c0368670a0ca8'
	'c106e06b308eb8b75b685ca69010afc7'
	'bb14af2866f76f55e8f1b84a79288262')

build() {
	cd ${srcdir}/smolt-${pkgver}
	patch -p1 -i ${srcdir}/001-Client-Hopefully-fix-encoding-trouble.patch
	patch -p2 -i ${srcdir}/002-ArchLinux-patch.diff

	cd client
	make install DESTDIR=${pkgdir}

	# Now fix the symlinks
	rm -f ${pkgdir}/usr/bin/*
	ln -s /usr/share/smolt/client/deleteProfile.py ${pkgdir}/usr/bin/smoltDeleteProfile
	ln -s /usr/share/smolt/client/smoltGui.py ${pkgdir}/usr/bin/smoltGui
	ln -s /usr/share/smolt/client/sendProfile.py ${pkgdir}/usr/bin/smoltSendProfile
}

