# Maintainer: Alexandr Boiko <brdcom@ya.ru>
pkgname=accel-ppp-lts-git
pkgver=20140313
pkgrel=15
pkgdesc="Kernel-mode PPTP/PPPoE/L2TP server"
arch=('i686' 'x86_64')
url="http://sourceforge.net/apps/trac/accel-ppp/"
license=('GPL')
depends=('openssl>=0.9.8' 'pcre')
makedepends=('git' 'cmake>=2.6' 'libnl' 'net-snmp>=5.x' 'lua51' 'linux-lts-headers')
conflicts=(accel-ppp)
install='accel-ppp.install'
options=('docs')
backup=('etc/accel-ppp.conf' 'etc/accel-ppp.lua' 'etc/snmp/accel-ppp.conf')
source=(accel-ppp-default
	accel-ppp.lua
	accel-ppp.tmpfiles
	accel-pppd.service)
md5sums=('e6922a52102c5d8562310bdfd17ba9ad'
         '23e32b0d758be2adf0f7b6987857afc2'
         '5be7d42b434b74d7e692b19a9e3c4297'
         'e5dec17bd405052fc647a805db5dd449')

_gitroot=git://accel-ppp.git.sourceforge.net/gitroot/accel-ppp/accel-ppp
_gitname=accel-ppp

build() {
	cd ${srcdir}
	msg "Connecting to GIT server...."
	
	if [ -d "${_gitname}" ]; then
		cd ${_gitname}
		git pull
		cd ..
	else
		git clone ${_gitroot} ${_gitname}
	fi

	msg "GIT checkout done or server timeout"
	msg "Creating pkg..."

	if [ -d "${_gitname}-build" ]; then
		rm -fr ${_gitname}-build
		mkdir ${_gitname}-build
		cd ${_gitname}-build
		sed -i 's|RUNTIME DESTINATION sbin|RUNTIME DESTINATION bin|' \
		"../${_gitname}/accel-pppd/CMakeLists.txt"
	else
		mkdir ${_gitname}-build
		cd ${_gitname}-build
		sed -i 's|RUNTIME DESTINATION sbin|RUNTIME DESTINATION bin|' \
		"../${_gitname}/accel-pppd/CMakeLists.txt"
	fi
		
	cmake \
		-DCMAKE_SYSTEM_NAME=Linux \
		-DBUILD_DRIVER=FALSE \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DLOG_FILE=TRUE \
		-DLOG_PGSQL=FALSE \
		-DCPACK_TYPE=Archlinux \
		-DSHAPER=TRUE \
		-DRADIUS=TRUE \
		-DNETSNMP=TRUE \
		-DLUA=TRUE \
		-DLUA_INCLUDE_DIR="/usr/include/lua5.1" \
		-DBUILD_IPOE_DRIVER=TRUE \
		-DKDIR=/usr/src/linux-`uname -r` \
		../${_gitname}
	make || return 1
	#	-DKDIR=/usr/lib/modules/`uname -r`/build \
	#	../${_gitname}
	#make || return 1
}
package() {
	cd ${srcdir}/${_gitname}-build
	make DESTDIR=${pkgdir} install || return 1

	install -d -m0755 ${pkgdir}/etc/snmp
	touch ${pkgdir}/etc/snmp/${_gitname}.conf
	install -Dm0644 ${srcdir}/${_gitname}.lua ${pkgdir}/etc/${_gitname}.lua
	install -Dm0644 ${srcdir}/${_gitname}-default ${pkgdir}/etc/conf.d/accel-pppd
	install -Dm0644 ${srcdir}/${_gitname}/README ${pkgdir}/usr/share/doc/${_gitname}/README
	install -Dm0644 ${srcdir}/accel-pppd.service ${pkgdir}/usr/lib/systemd/system/accel-pppd.service
	install -Dm0644 ${srcdir}/${_gitname}.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_gitname}.conf
	install -Dm0644 ${srcdir}/${_gitname}/accel-pppd/${_gitname}.conf ${pkgdir}/etc/${_gitname}.conf
	install -Dm0644 ${srcdir}/${_gitname}/accel-pppd/extra/net-snmp/ACCEL-PPP-MIB.txt ${pkgdir}/usr/share/snmp/mibs/ACCEL-PPP-MIB.txt
	install -Dm0644 ${srcdir}/${_gitname}-build/drivers/ipoe/driver/ipoe.ko ${pkgdir}/usr/lib/modules/`uname -r`/extramodules/ipoe.ko
}
