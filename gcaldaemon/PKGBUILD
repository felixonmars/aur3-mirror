# Contributor: Nicolas Bigaouette <nbigaouette@gmail.com>
pkgname=gcaldaemon
pkgver=1.0_beta16
pkgrel=2
pkgdesc="OS-independent Java program that offers two-way synchronization between Google Calendar and various iCalendar compatible calendar applications."
url="http://gcaldaemon.sourceforge.net/"
depends=('java-runtime')
source=("http://downloads.sourceforge.net/sourceforge/${pkgname}/${pkgname}-linux-${pkgver/_/-}.zip" "${pkgname}.rcd")
install="${pkgname}.install"
arch=('i686' 'x86_64')
license=('GPL')
backup=('opt/gcaldaemon/conf/gcal-daemon.cfg')
md5sums=('da5ef2fe0e8bb2a8cf47aeecb4c5a3bc'
         'f17e580811412bf13d0f2d5c9f26c7c0')

build() {
	_pkgname=GCALDaemon
	_installdir=/opt/${pkgname}

	mkdir -p ${startdir}/pkg/{opt,etc/rc.d} || return 1
	mv ${startdir}/src/${_pkgname} ${startdir}/pkg${_installdir} || return 1
	rm -fr ${startdir}/pkg/opt/${pkgname}/dev || return 1

	cd ${startdir}/pkg${_installdir}/bin
	chmod +x *.sh

	sed -i "s|^GCALDIR=.*$|GCALDIR=${_installdir}|g" ${startdir}/pkg${_installdir}/bin/password-encoder.sh
	sed -i "s|^GCALDIR=.*$|GCALDIR=${_installdir}|g" ${startdir}/pkg${_installdir}/bin/standalone-start.sh
	sed -i "s|^GCALDIR=.*$|GCALDIR=${_installdir}|g" ${startdir}/pkg${_installdir}/bin/sync-now.sh

	install -m 755 ${startdir}/src/${pkgname}.rcd ${startdir}/pkg/etc/rc.d/${pkgname}
}

